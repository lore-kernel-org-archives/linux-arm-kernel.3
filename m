Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F406C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	MIME-Version:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CPMj0ncxFSqVo0wnr/hLk8JA8RU84xQsibaNEVs17jk=; b=R+ysHlHbCiCkQY
	LEm3X5obivFc9X1nywoFf9tL24eYRYJ/0FImiI2iR9kzR8DmwI8/SRnuK7YeU/WxUlo7WoRbbWPnR
	3yPo80Y+YoaBB9MmTicRWqPnCln+nkBSIEux+NnpkYCq7tuGjj9XeberGozbH0DUrVgKUe2VV1dyC
	3+dCt3dyc6dHAxXN2wE2wnC52briAqgFP1t+sylmRYq95sQWeBn5mwwSXJuBEF1NWPMjbYtNTf/Iq
	Ip05Q3uk8TtPGaTfCAwtsGYOZuzdQ3q1YcVR0iSi6BIBnXf10QEdN0lLrfXSrrgcmnb4jRq3EjMov
	NRUPnflT6VwvPiLslCUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tifJy-0000000CTKQ-3WOQ;
	Thu, 13 Feb 2025 19:56:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tifIY-0000000CT65-1zm2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 19:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:To:Subject:Message-ID:Date:From:Reply-To:MIME-Version:Sender:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CPMj0ncxFSqVo0wnr/hLk8JA8RU84xQsibaNEVs17jk=; b=JQ5J8odhpOUNjkIeFjOK3QreoA
	J3ctJL//ON3rvrn9j7eFpXAsZOvZcO6mftgY+hLTq9YM+t88tLjzKpkccid69YCSZkYhl8oElGZaH
	SS9FKd2ikTUzXDNH1VKgKRzB3s3TaVVgAPhBH9OKE5L1PJI+jE8X0HoDf0LhNKzdWK1poexkfOtTN
	xuS/aK+aY0b74520ce5J4HXSFq70nx4d58BVh3jl9TXBUkage2p68Ci2HI08Khs8uWvf3TdRfr4De
	7wRY4J4re+DFIppEIZscu3i5b7AFGZBUcL4vodSuI1fD3Kq8dJ6bkeWCLozwyaCyIzufaDwlb2nZd
	6GP5IBsQ==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tifIV-000000014m8-2kFt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 19:54:57 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab7ee6f54faso151593666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 11:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739476493; x=1740081293; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CPMj0ncxFSqVo0wnr/hLk8JA8RU84xQsibaNEVs17jk=;
        b=VElC+afSo5pmIskt4INbXL6fPGyGLeEnwWUaumLpR9fcM2Z4H9QLloubESknJtPFZz
         xzZKyKuqItNsehtjBcE3c80nzPmROoI/iMlApEVQpYU0V4OWmAO490UK7d8sM1KkhLBH
         4e7rMB3dBE0JYDVsmdKRas2CehTLtgfTNdBEtj4fkVyWHGH7fhcCuWz0Bes7Z+09f5Zi
         eJWpuPW/Quyhvxup35so5KKw99jcqM/vcj8m2o8nt0/44+iFMvfdkWij+Oj2+7LN4ccJ
         toHFQsHChzR8acn2f2hELXpFi8Sxpm+o9ms1eQvRGeZoAeHUwdpfIMsIIcYIsDjmDmsu
         nydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739476493; x=1740081293;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPMj0ncxFSqVo0wnr/hLk8JA8RU84xQsibaNEVs17jk=;
        b=a9JaGOG7Zi6fjqZxLeCMeHjcP/In5Xtl+U7iodgv1u7Cq02D9ar3kr18S+WXeimn/z
         Mkb4Ib1s6Rkymarjjz1ozenc7NWVZjbYEUTHaZyoOvxzEIJyhPv5CR19BJR7WMhe0leb
         kD1bTaX6t3qShXL+ooG+PjpZaQlSnMQjVKmEpJaUB3JIDK6NyWf1QjkBk9fczUg8dyZK
         22pJnaq0H3OvwYXnv9HBxAPBiMm3RUGG/s70V14AT2JuQAgRzUK7XIrpV68R3v9m/Dla
         QJW3uNzeWL3xqaHnWxesYJv1yaqmKLXswomy+RI6sMbPLw1T5Jf4YFolSZNjCm8KNBNA
         jAgg==
X-Gm-Message-State: AOJu0YxBbhHm7eKCOUJiqiNlU13yc8L/2qjdRl9gofVgEJxsPhsQjhf4
	qZTH/99wrnlMhKnEhrYRLgySOTrBMBw87TGxfmzDKalwbP7YfW7pPnRhkrxyR5uu/UDA8LqTcgM
	hBVxb72W4cI1YHII0K5wIBz+3ppauB6g6
X-Gm-Gg: ASbGnctgLlDIXxnIzEL9EDP3dsjXKNuziCLgs/OUb/iYRpM9a4y+IIB3eAJtvk8fHRL
	1BoXyV77qvItAp33yaOfGwHYQGQ9uXuslfqO1P71+ovaKnHgDhrSd3Edo2tjGf2mTpwBUGpG/
X-Google-Smtp-Source: AGHT+IHQU+0J0bK0X97SdiOiBd028oQ8KpmNYl1Yxv3PYKpn9WU9Fv6xWuGCP4jdYjVhxDWKbf0ycSlfcJ6hrQrNYRw=
X-Received: by 2002:a05:6402:13c9:b0:5dc:796f:fc86 with SMTP id
 4fb4d7f45d1cf-5dec9d4a4ccmr10086399a12.16.1739476492945; Thu, 13 Feb 2025
 11:54:52 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Fri, 14 Feb 2025 03:54:40 +0800
X-Gm-Features: AWEUYZl4cgECuUXx86DThTcaKW8n6vvtIZq3B_m_nSxBbgnENw-4WKZGY-aH2KA
Message-ID: <CAE2XoE8QhxT6AbsffEVgjYRaLNPz451JbDwcb0Yn23271z3A8g@mail.gmail.com>
Subject: Testing [PATCH v2 0/4] KVM: arm64: writable MIDR/REVIDR
To: linux-arm-kernel@lists.infradead.org, Sebastian Ott <sebott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_195455_752496_5BB5587E 
X-CRM114-Status: UNSURE (   3.24  )
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

I have the commands

`-cpu host,aarch64=3Doff -accel kvm`
```
[ 1471.611306] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 00000000000=
00000
[ 1471.611315] Call trace:
[ 1471.611319]  set_id_reg_non_ftr+0x98/0x168 (P)
[ 1471.611325]  kvm_sys_reg_set_user+0xe8/0x240
[ 1471.611331]  kvm_arm_sys_reg_set_reg+0x40/0x220
[ 1471.611336]  kvm_arm_set_reg+0x1c0/0x5a8
[ 1471.611343]  kvm_arch_vcpu_ioctl+0x61c/0x8c8
[ 1471.611350]  kvm_vcpu_ioctl+0x67c/0xa80
[ 1471.611357]  __arm64_sys_ioctl+0xd8/0x130
[ 1471.611364]  invoke_syscall+0x74/0x128
[ 1471.611370]  el0_svc_common.constprop.0+0x4c/0x140
[ 1471.611375]  do_el0_svc+0x28/0x58
[ 1471.611379]  el0_svc+0x40/0x1a8
[ 1471.611386]  el0t_64_sync_handler+0x134/0x160
[ 1471.611391]  el0t_64_sync+0x1b8/0x1c0
[ 1471.611398] Code: 2a1503e1 97fffdff 714602bf 54000041 (d51c0013)
[ 1471.611405] ---[ end trace 0000000000000000 ]---
[ 1471.630443] pstore: backend (efi_pstore) writing error (-28)
```
--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

