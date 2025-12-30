Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6368AE94108
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tRxRWQzRmCYnQKX7qKIJ6OMcfRXAAVN0sUWsz8Z3ZE=; b=Uodff3wtOwfrjWCfK1Al9VSho1
	zHAUTy3mYU23Q1pwXRQFE5LJNHm+6oiklI2kYBPtWUV3xuwYcMzgISHMFl1y4LnXYISzznA07n6zF
	9G4Om21qM43aTWETNDtiVH/F5uh0TtX7bkd1OsI1JAp06vvXCNbhRKHPFmBp6KWMIF2TLDKn9l3Qj
	8QPqNKnzBKIWJ8u9JGXH50+SSTEom0wYbVGrEFD+GXmHghFjqh/KbzpJddJfDthJR1IozFyDbjekN
	clJq1WWOAr34dxx30HcUpw7xT1QoHGXiK8RWNm2p9+t9kzNuhdm92XVRM+O9EcVa0QoSmCDavMVb1
	wloWWNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWWc-00000004grK-2agp;
	Tue, 30 Dec 2025 10:00:22 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWWa-00000004gqj-0srM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 10:00:21 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-598f81d090cso10433909e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 02:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767088818; x=1767693618; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tRxRWQzRmCYnQKX7qKIJ6OMcfRXAAVN0sUWsz8Z3ZE=;
        b=NZCjt4gG1yWby/KKKx5ZYvKh9eNDLQyx3WSO5eKtvKlgKIAzk2bpOwC6pf+0RrMaSp
         lViCGU57bKQ7IEV2Sx/LIzUxJpe3xtaA229jng4by8QeS4qNCKeGx/5vcWKytuRf60c8
         yOl/qohbmwoqb300N00r6+E7sEzIAKLDWEwGJt4vSak+znj/QdLb+60+MRm/q4sTneYT
         0ifck51WWhDX0f2yol47L3B1UGif7KqC+Engnq++ISow26kSz16MTsDK1X5sq+VhOPej
         H7FJCRm4V/C7kKgIO1S+fv6x1Ddn4WnZB0Vcf52OmgLL6IRRaRjEOfGDwh9jdQ5xIX6R
         0YhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767088818; x=1767693618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1tRxRWQzRmCYnQKX7qKIJ6OMcfRXAAVN0sUWsz8Z3ZE=;
        b=GiIDxq5C/rGwJ4LtASjdfRLR69jItE5DyjYlzbxneZrd/40UhsGms34KhlwNlsi9uT
         pPGp5nNaQ/yCakeQzDaJGqqxPxW9nSSDtIRabx1O744JbXar/O+78auPACx6v5RCq90Q
         1T+BZBqj1jsxfNrCQoi8Q6PhqxpeAXxTZGgy/0yJQEDuPpnRz+oirv2sGI67xOO43VLm
         lx1ONBwL5XcT5xVbADGsnSHGMc2F35EQV1EnMZpPJAJPu5w28ok8p8zn3HttLMNZtYrT
         El6kIrBrwtWAf1mtbKMbVQH5SpoA5nDynD6khxAYkvc2evQoU8/oaU57J9Auqxx5TwiR
         am4g==
X-Forwarded-Encrypted: i=1; AJvYcCXFx4Y5la3/TYzz1Dmf87qvqPqyrGRszMtwzobp8Hg2DFiGfi1ReesztRUfRNGIoabI2UAcHQRlOY/TKWHkuvZH@lists.infradead.org
X-Gm-Message-State: AOJu0YwYD/C1QJOX+qkwQDaMZ+QKdAap9W2nni5wsn5yUKX/O4qqJGdU
	MeqoWJMuATYHZrloDzxFd9NQqiKy4P0rry6nDHzTY4+Ugc6lav+S0vdrIvLnmgM+A8Rdl++IHey
	rs4MXySbiTy4x7UmwmT1HfsEfGLFjlSv7pFOheBhdgQ==
X-Gm-Gg: AY/fxX79zUSTaKzrjkJsdQsd6IIYvJqvXi4ysaz5mg0bTV1sEoWoKRLKT6tICFqLQ/H
	JXNGEZVJFVUNqN+rioAbNujR5tKQEfywxXV2uzL+O0q+38lp8JhFtr4MHOrJhintuy+RyMsgWy/
	0PEELy9kQKMg7O6YUvI52Go/pbiCZwrDHsh/Fs31XQZScKSJTXbraUG9F6iOntNqiwZLa3OmS3R
	IYTRuVOGvkKkQvgxIh05uNrKultLm/IEgxfhZFpzKNeD9n1AJOnaL4wns2Ru24xh0ppqB7cerKu
	FLeLl/e0sxb3tGu3xX/mdWpzIue9
X-Google-Smtp-Source: AGHT+IHBp58C8eJD8jHt03+ooDUgedGd0HZ0sHq7BopU+wSyE8cBf88UU/sRfBN6CkzcQxn+JuN8ykjj+lfX1LiB4HA=
X-Received: by 2002:a05:6512:b94:b0:583:903e:b5a4 with SMTP id
 2adb3069b0e04-59a17d61e3emr11072799e87.46.1767088818024; Tue, 30 Dec 2025
 02:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20251114104325.116471-1-marco.crivellari@suse.com>
 <CAAofZF51pkOzrg_nO0Mhx6g9b3JPtO3n+0YE=WtSgj_F6wnY4w@mail.gmail.com> <CAGp9Lzoj2jeGF+t-UP0gAykCZ96-OkjummeJRGniYfagvY-BPA@mail.gmail.com>
In-Reply-To: <CAGp9Lzoj2jeGF+t-UP0gAykCZ96-OkjummeJRGniYfagvY-BPA@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 30 Dec 2025 11:00:07 +0100
X-Gm-Features: AQt7F2orGzKXzw6tzrN805-5mgW6Z8EpIc6FGRlg6vkCnPmNQoxfEOSCoRxEkUQ
Message-ID: <CAAofZF7KguhtNs_cXQdWgz8XdaChMG8G_LtEmhKfgC5_yq3iRA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: replace use of system_wq with system_percpu_wq
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_020020_247649_B950022E 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Dec 30, 2025 at 12:42=E2=80=AFAM Sean Wang <sean.wang@kernel.org> w=
rote:
> Hi Marco,
>
> The patch has been queued in the mt76 tree. Thanks for your work on this.
> https://github.com/nbd168/wireless/commit/ee518f914cd901c16fa08a6f228b266=
551f72a6a
>
>             Sean

Many thanks Sean!

--=20

Marco Crivellari

L3 Support Engineer

