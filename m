Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A094C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 19:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hC5pjueK3njHG+/S0PsoYfxNvXRhtdE6Y8ckyHhZnt8=; b=pLLJYn8Odbkn16
	JGFdLZ5YHSobxG/KObdaQ6Vxektg1G2+I6pk3jcub1SndGIlGLMx5bFu0voucwNSGVGVp6D5ULFKB
	FTtKb0wLYO26VAdpC0XzMIUeYvTwxj0rTfipOzcd2wCmG+CMEgL8DRySNpAg2EXY3zs2xgttoQdw3
	PKLN4lShI6M/Q3Gx5vAe0Imhsd47RnvKbuYKnV1sB7g3+hRM3zGWfCNl8dI8Dmhu9tIRppfaV4Zgz
	Kc/f8Zb0pkwVqmQD1Rc8PLYoOpjdOb3VEK+UUpuibB3n3XJscNbDeRFW0JobkINiUwRB2Tn+Vyd5G
	A6M4fuWrgHojZF+A+fRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjk9v-00000002Rtq-25GU;
	Sun, 16 Feb 2025 19:18:31 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjnm-00000002Orj-248z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:55:39 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so2226822a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 10:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739732136; x=1740336936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hC5pjueK3njHG+/S0PsoYfxNvXRhtdE6Y8ckyHhZnt8=;
        b=AdgGyJxFqW6e/wIcqldeHKbmEPG7l/VHeX1Sf50Swo4HV4c/SS5nEKF5tvINuFvNCo
         DYbmNIBYr3kDBWY1JRZAJels2sF6kmj8blo3sU8ztUOiBCQSYIoSgP9nCnE01RlW2iM1
         aybID2LmzYpZ4pWJeTwl71jxiBNvJJY8UPeQFldh48+E3+4KMbRQyhyPW/czb5xY5R3F
         Ij7Q5Ru3ci8JOFG5iK5v5rLMZDSwX4KsAUj9icTnZz+udCL3sb+dSlLOdl38G7we5iRu
         9nxbPCipEdm7CXe0ilnNn9hjyq3YH2S3cYfneID0etYinEnSH4cK43/Xn9R6qnTa4Jg5
         72+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739732136; x=1740336936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hC5pjueK3njHG+/S0PsoYfxNvXRhtdE6Y8ckyHhZnt8=;
        b=AwYrubXxCAiY9W9q/vznMLnS107oX7+UDOx6GLn2NFH+8L+OwNc78/wBz8/CfKX/Q9
         LsXeuOhkIC+erLH8iDjz2mDlS9tnKa4Ird/l/dPp6TdXlXaztwuZ+DsN3G9EOrbT4ATB
         3k8stXfN26PZQTcjIeg3R81g9tT73+bE33UkQjXPAMrG+3W8FDJC+EiTwceRvtoKWQu9
         v5QJ6wt1PeVd13xmWnTjpuOkzoHUIdDP4SXkds1gfQKhjVO/NbZ4utdmdExVcbPcL7kR
         6ohZmutuL2eHMKdl+3M+M+cEpXQ3lDUuLfgszPhve+CxI7xMza783bZq/5OGhV7XeCQh
         ZWIw==
X-Forwarded-Encrypted: i=1; AJvYcCWzUJGFf0/l7ysRB1YARVb00d5bNHStB488okZ6nyy0LuWbouZokrqs9PUz+UilCFqZwPaAw4erVNYc/YT8Is6g@lists.infradead.org
X-Gm-Message-State: AOJu0YztvRYFsjWnBN5ADRZJcjXR+0RJI2GOeObqXycFyujpR4ATj9Xk
	9OuUSDmjTX9WCsByzCxjen6819OR5WiPg+MwVGYUH2DEqgHGcaeeJTyMuROLjlZmxeJFwjtli0H
	2BpxWuEST3Yw9tm0ElyCTl3X405E=
X-Gm-Gg: ASbGnctfywPbk0EmdsyodRsWbKLDk5/RoT9qbg2dp1DIAVAeJkGVPcqUoTgKuf5cV5S
	/dKmxUcbhHiHofKQfoqbPDQM7nB3s3JpwkMJ9bku5OhL4LTUCaThKy7cXlSGvzMfiSnPw+vJG
X-Google-Smtp-Source: AGHT+IEMhW69OjMic/GlsnphTy5HjgljXL7lYabt3t/KZP5dlB7Z7axgQFJTFGXD1Wtre/ru3ZMNXPSCNMU+4lVJMnc=
X-Received: by 2002:a17:907:7f27:b0:ab7:d77b:43a3 with SMTP id
 a640c23a62f3a-abb70bdba40mr717236866b.32.1739732135933; Sun, 16 Feb 2025
 10:55:35 -0800 (PST)
MIME-Version: 1.0
References: <20250211143910.16775-1-sebott@redhat.com> <20250211143910.16775-2-sebott@redhat.com>
 <Z7BoydkyT_h0gwOV@linux.dev> <CAE2XoE_8ihJZQF856w-_F+cgJW7fLWGz7M7Ztoxzw2vE51_m1A@mail.gmail.com>
 <87v7tb17os.wl-maz@kernel.org> <CAE2XoE9=hjP+qpsy+FcYcSDectDajiXjtcMCVpacSo4cFOo=tQ@mail.gmail.com>
 <86jz9psqwd.wl-maz@kernel.org>
In-Reply-To: <86jz9psqwd.wl-maz@kernel.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Mon, 17 Feb 2025 02:55:23 +0800
X-Gm-Features: AWEUYZk3_EEMv5D6Rj82ShfmoPzBCN_NwGOjAGxgYCLPZKy3POf8ciw95cVy4Uc
Message-ID: <CAE2XoE8i=jPgSea5jXY0eOxas9Y_2pa7QheqS1xuw2qeTQDNyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Sebastian Ott <sebott@redhat.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
	Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_105538_536657_9ACC4C01 
X-CRM114-Status: GOOD (  14.73  )
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
Reply-To: luoyonggang@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 17, 2025 at 2:09=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Sat, 15 Feb 2025 19:04:20 +0000,
> "=E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo)" <luoyonggang@gmail.com> wrote=
:
> >
> > According to this, the MIDR EL1 is updated properly, but the MIDR for
> > aarch32 is not updated, and I don't know how to hook the update for
> > MIDR for aarch32
>
> It is the same thing. The AArch32 view is configured the same way as
> the AArch64 view, and there is nothing to do at all (that's what
> VPIDR_EL2 is all about).
>
> With Oliver's change, I'm correctly getting a different MIDR using a
> hacked up kvmtool, see below. I suspect you're not running with the
> correct patch applied.
>
The applied patch is V2, with writing vpidr_el2 disabled, Is that the cause=
?
The branch is here
https://github.com/lygstate/linux/tree/main
I am not applying your patch

--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

