Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A799BC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 21:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVGkG54NMX/PBZr7fvsTCBgXukBm/shkEpiY5UB6l2c=; b=bONQhr30BgDrIn
	wYYAO8HywNESQx1SGYL84wATM/12l2ojJEWssH7pGO0bSP/WUl4LA9GO1HcXiOicHI5OGkZhxJ15o
	9wONMj7MO/MQgxFq7PgoNeBDXbvoAenPT43sB5DpH2bd3SEm2Hqj6cte4qSijJ9wA3trwMzAkaZxz
	OExUZoe0cIVrUO8c1ivdHvgTZ/XIdMmYan1sqA39vEdoQ7bizwYsHVE7PkaNe+d5cSW62pNQV7W+t
	fdkFavG5LW/HZRvdXRTXanp2rVqi93cTwFctr1YAWBooJvAiC5xxc0N3I6kcqF+eytpUjn2PpxI3G
	MHwPZW+9z1NnUlSNo/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3FL-0000000GGqc-29gZ;
	Fri, 14 Feb 2025 21:29:15 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3Dt-0000000GGcs-1Vs3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 21:27:46 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so2770156a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 13:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739568462; x=1740173262; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVGkG54NMX/PBZr7fvsTCBgXukBm/shkEpiY5UB6l2c=;
        b=Gcn194GVxph83Iik+A/2rJJDIwGIuZZfOmQEJxIzxv73eFJ2hg9o+GZ0v9WLgkC8KD
         CoxEAaaFxQtqfwHCCiiJwPE99xjWT6FH8WIP1GrOX32VzDkSEKzO5p4lycuHSjndNvny
         tn3gZu5UzYldf/IX5BxHVmVXG/5XGUc0uiTgwJRlsukH9aEnSGC+7muWUyAXKmi+nGT1
         ee2n0QczzQ8aCXo3WDF/ChiJSOBKiOrtlvUjM5kSnDwt+r89KOwtEGDQMqVZ6kvpzv4Q
         g31KtNJ1m5C7q7wpDdkkwvR/33AZ4NptyJz8s3xJ25aZACD5CSOKSLixCRRQznigpfKC
         0RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739568462; x=1740173262;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVGkG54NMX/PBZr7fvsTCBgXukBm/shkEpiY5UB6l2c=;
        b=X9Hba1z2XlU/c9GGW6bYa5/2ze6WTwiZPq2l+2ukC1XNdNEtdisesKGDV7vkE0mubs
         WQaVy6zSlNVnTjOvQQXxTRYP97NdYMob1+vvinx8KzCdvYTICi1LYop+/26x41o9vZ48
         W5YKRlH3RYEnevwhbZdIdW8KmWpmh+oG4MXCkcC5YxCl6WSpg0nBCNnue06+kxRkrWAZ
         HFzSWwDNh87s1aO9mikZZ0+/c01avr+nWcXp4QUwqsNp7NZWzkiBXNJGahXlnFeUBQ+h
         Pkl5W2n10W08De4F2xg/WIBOf2hnvGuxGWgBF9ftbP50wc7jWFVgS7rH5lE7Da8pYTsx
         enYw==
X-Gm-Message-State: AOJu0YwDO4gDGCVc0mVnzrT6UoKcviluS8Re1ZtSgOnPVlbQSl59q5fH
	mg510t0pQx26Bj8Gui6iEtSumMe3ixMwVLvXzeS1jgLwFajlmwPmL81uwTO7gGImSfcsLHF/aro
	z2KkldtALK+5v/j7tPyYvmfoKoqW4jy7r
X-Gm-Gg: ASbGncuYllpxEz7V4doLATIzSArK4lFknG627ZlLBttofhLC4MclSHi8yQ6gJdCDETq
	bkTIaZDlip3TEbTr6ONWwMqrKY995Lw7zBxCdVXxO6Dy8DVVVjxmhX7pUeORr1Xny21EB4TER
X-Google-Smtp-Source: AGHT+IEFKEowU/Ek7Kn1D87b0d5nT4N1XwYUGb1oUep8NinnzyMTsoqNUCw6PvCzm8o/ah3JA9OkPHyJUiu03UtUPrQ=
X-Received: by 2002:a17:907:1c21:b0:ab7:faca:a323 with SMTP id
 a640c23a62f3a-abb70d677c5mr66128266b.39.1739568462220; Fri, 14 Feb 2025
 13:27:42 -0800 (PST)
MIME-Version: 1.0
References: <CAE2XoE8QhxT6AbsffEVgjYRaLNPz451JbDwcb0Yn23271z3A8g@mail.gmail.com>
In-Reply-To: <CAE2XoE8QhxT6AbsffEVgjYRaLNPz451JbDwcb0Yn23271z3A8g@mail.gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sat, 15 Feb 2025 05:27:29 +0800
X-Gm-Features: AWEUYZmGNIZEX-OdRQ1LDk9LWqBh6tvX95oeMvUqu8RxvE1b3TBmFcpjCsL1CKI
Message-ID: <CAE2XoE-E_B62L2Dd=NOMJ01i661U+FbWhGPzBun2=o8dhtQDQg@mail.gmail.com>
Subject: Re: Testing [PATCH v2 0/4] KVM: arm64: writable MIDR/REVIDR
To: linux-arm-kernel@lists.infradead.org, Sebastian Ott <sebott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_132745_397626_CF372250 
X-CRM114-Status: UNSURE (   8.47  )
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
Reply-To: luoyonggang@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

I also found the aarch32 CP15 MIDR register not trapped,
so updating SYS_MIDR_EL1 are not working with
`-cpu host,aarch64=3Doff -accel kvm`


On Fri, Feb 14, 2025 at 3:54=E2=80=AFAM =E7=BD=97=E5=8B=87=E5=88=9A(Yonggan=
g Luo) <luoyonggang@gmail.com> wrote:
>
> I have the commands
>
> `-cpu host,aarch64=3Doff -accel kvm`
> ```
> [ 1471.611306] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 000000000=
0000000
> [ 1471.611315] Call trace:
> [ 1471.611319]  set_id_reg_non_ftr+0x98/0x168 (P)
> [ 1471.611325]  kvm_sys_reg_set_user+0xe8/0x240
> [ 1471.611331]  kvm_arm_sys_reg_set_reg+0x40/0x220
> [ 1471.611336]  kvm_arm_set_reg+0x1c0/0x5a8
> [ 1471.611343]  kvm_arch_vcpu_ioctl+0x61c/0x8c8
> [ 1471.611350]  kvm_vcpu_ioctl+0x67c/0xa80
> [ 1471.611357]  __arm64_sys_ioctl+0xd8/0x130
> [ 1471.611364]  invoke_syscall+0x74/0x128
> [ 1471.611370]  el0_svc_common.constprop.0+0x4c/0x140
> [ 1471.611375]  do_el0_svc+0x28/0x58
> [ 1471.611379]  el0_svc+0x40/0x1a8
> [ 1471.611386]  el0t_64_sync_handler+0x134/0x160
> [ 1471.611391]  el0t_64_sync+0x1b8/0x1c0
> [ 1471.611398] Code: 2a1503e1 97fffdff 714602bf 54000041 (d51c0013)
> [ 1471.611405] ---[ end trace 0000000000000000 ]---
> [ 1471.630443] pstore: backend (efi_pstore) writing error (-28)
> ```
> --
>          =E6=AD=A4=E8=87=B4
> =E7=A4=BC
> =E7=BD=97=E5=8B=87=E5=88=9A
> Yours
>     sincerely,
> Yonggang Luo



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

