Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0562AD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQquqAu6/qCcdhWS32lvmrFBYi1dx/b7SfpwVH0yya8=; b=1EMz79jd2k9SXsDqM56ApdoQoG
	XlEzTfqt4Ivi20Lr6/WpBRACAmyknx65zD/knbMX53DsdRP9+boi0mmP8BP/n8aY5oeCHP0hxxqJu
	lGzualnQmCInt+mF2F56UPnGdjJq/GYneaVeJugoh07rLvqV/xcr5GdiV2ZvpyL/9gnjgpPoscKet
	qKWjiIK/mi7MGzrF/vwFhC0FHCTdkcJicbXkcuTVLlgoqRdLu62vfmRcN1qHDMn6mJRMy+gPUWRkL
	lcGPRJ23lPbDX0Zs487VEWm3JdVXkFDg+OTE/pNpFVhfXTJxGv3/9DAe6wagP1jJ5NcNcXntRC82v
	GYHvV2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQNw-00000005R0Q-00Fp;
	Tue, 02 Dec 2025 13:25:40 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQNt-00000005R07-0fd8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:25:38 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5957c929a5eso8165710e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 05:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764681935; x=1765286735; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQquqAu6/qCcdhWS32lvmrFBYi1dx/b7SfpwVH0yya8=;
        b=LseXHWga9ZFMsDGUsHCVypdeJWJj4CcfkAp8FidQS/sjixIKfI+I+b/7tjYWUQ+3h0
         VBlVWS/u+LlDgxswHu4QwBxF/gegCXCBd2823OlPD1O5LkjgEwIqP501yMaQOwEHbpRu
         GGA8/dQ2yDcoVBN3zk0vlVcdzQy72HOnTc64mcEqSzD+2GRiqNmU/H575AhPKgWyIGu/
         iQYrlXHUswQQRO2nFOAaEcwo1Jr1deLHLWYrZYvb/eWw+3qse35Sjfsgpus1/ZzG/yqX
         g09yUa9LaAc/YmGT9nlP4aik5amrdx1hk4uXSkqjNVEdJKMRhxNE6lMs6UHtC7PWAea4
         aQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764681935; x=1765286735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mQquqAu6/qCcdhWS32lvmrFBYi1dx/b7SfpwVH0yya8=;
        b=XQveHSJLf/ga7i6nScLJrPhnbJRvXq+ZwlCigIUkPgULJx2fnnW8JnK9fGN8TGsQGL
         S2Qs137blfkWAOY+AmGEWXU3U1CC/oCWlv17nEmIu3nSTO71LqcdRpSKeD5pPtTXYAsn
         p1MmECL/y9tQsvaKRSYn0RJe2lfIz9R/B7I9UzR4Wfq8fwmsMAOHntFB7XAsFjX9Mazb
         3DCAD9TzNab25KPvltJVijV7jEZsWsF1q3LGtnh6g5KulxgXxLrZhPVeuCuMVZ6NTSug
         GCOVnT3zw0SukXtTtTQo62GCc3yoF9BYKnEA+OoIos/m4vmq03Ff1QmulXXlaR5qcL4N
         T42Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/Ux8EYffnYV/xVMb8xf4qLk/i5w93I3YZN+T8dvfQkL10EUug8w9k37/Kgubeq49fiOEVYQ/M77LGRyWeqSI@lists.infradead.org
X-Gm-Message-State: AOJu0YxzPzcugmD6CKYFWefy6u6JNBdtJKFSdIws6AHwq3MRexkfwX4+
	yeEoGU3ajdFws9bde+BrVH4f9Bs3lU6SeJ6oP+vBxWWdMxhE0+iQgs648X4OABGSG+cgXomHb0q
	60FuQLumS5najygPqF1e8NnQDccA06htk+XLCDX/+NQ==
X-Gm-Gg: ASbGncuR4maJ9mhR7jKdMxrc5x76zdMd3AO8/qFcqBY7AbN78jAayTIiAdraRXrgPOE
	s6y5k11SsKyoK0qggLSJw3UFGowBggR0PLWjTJ32USopD0TOqTSjI6gcxWJVx9EQHNSd9PBtf0m
	j85SRmjmJu0zfbcXPatmX/dtkOnYctD7Qf9ZVtJNFOdNMfXmPCF/OaKuSZE1d/ibJjxG1ktjTuU
	yLYddhq6XfrK/OYwaGZcb/2sEaJlNMMSb4y8QC4jxLOWaBUJn/LJm1zhaehOPhF6PjBsg2klZIh
	+ox4vQNuGgvt66SRqJIQBu6Mhx7i
X-Google-Smtp-Source: AGHT+IHou7nZE5Ilf8UKUMOpD4CZM22WKM1TurJF5m74LXb6VyfSJRhn84jfLaxF26oR9u46HD8r/Rg/hz6BasZ8Y6g=
X-Received: by 2002:a05:6512:3d1d:b0:595:9d26:f54b with SMTP id
 2adb3069b0e04-596b528e8aemr10068911e87.41.1764681935049; Tue, 02 Dec 2025
 05:25:35 -0800 (PST)
MIME-Version: 1.0
References: <20251104103942.96647-1-marco.crivellari@suse.com>
In-Reply-To: <20251104103942.96647-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 2 Dec 2025 14:25:22 +0100
X-Gm-Features: AWmQ_bljHGdHHhMerIEnRIhOfX30gvI0SzblvuvuNuzFCDNV9m0_b0l8luu3kg8
Message-ID: <CAAofZF4-D3PT_eE8e4VRX7bCkUV0d9h99YypeYyPhCg+sCFBpw@mail.gmail.com>
Subject: Re: [PATCH] soc/xilinx: replace use of system_unbound_wq with system_dfl_wq
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_052537_227228_231DC83A 
X-CRM114-Status: UNSURE (   6.45  )
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

Hi,

On Tue, Nov 4, 2025 at 11:39=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>  drivers/soc/xilinx/zynqmp_power.c | 6 +++---

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

