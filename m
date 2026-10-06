Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344B9CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVTf+5nPszzSOjjP6JGia1N3BVw0TCy5I1d9nkz0VXs=; b=lfZIIs7eJq55X0SgwxvWBoEop6
	QkA8+jnAyzBl5MYFzkR3xN3TqOakuIm+Yu6Wr5u1ku4tV9Z2R78fPsjgQLb0WginWPiNJa4cid2+v
	jEB3Trxsj/uRFtRSgrjUI5IK02hxuqZt2DFin8k+Ab0ICvViR5n8rtH8oBrSSAPsngbYpmkaR7D4H
	QwR6JgWd/PTWaeN4K5iPw8yPP+1ihgxp66/qKMRpBvrfLVj4C1NsWRJMrIYIKHtdHP+hNDwNGWlFt
	AlGDovak7vug3c3XIkI0dDHzPlwQIRSGGzlAcMPZT5DdKLXELr4MvgE+qxhOPUnp12bIY/w3FhjsN
	3G7MxHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7R9-000000014F1-2nyE;
	Tue, 06 Oct 2026 15:50:39 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7R7-000000014Dp-12bj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:50:38 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8abd68b3937so29982547b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 08:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791301836; cv=none;
        d=google.com; s=arc-20260327;
        b=ozzBluYVuH5cNT9K5GcXroo0q4ZZRyESfA/rTXUMnCWxEgaLqpUboml2urrhtLQw8Q
         DHqlcO5y/8D+apByPVntdSXJLFnCY0zDWMsQG7CmKfRcQCSnoqTCDdmf6SlSWm5/p1sj
         6BhYNGxmghPvWmg2wrHPOuD0Du+Do4eWyTGUt96EDm9zx1tvIwvzt5f1ZedboxUjXiTc
         MHL/OtaVvP85BJS5fcC2BcikSw4hBKJWWB5h314cxg75PC7outv1Qp9UB8+cXB8B7JJ7
         J6CBRwA/4KeHf1nSL3i8Yz7xrAUm0ptXrEBfnL8MxBs7tnDp99KxkJ77TCO4hl+yiZAi
         r0Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gVTf+5nPszzSOjjP6JGia1N3BVw0TCy5I1d9nkz0VXs=;
        fh=mpVK+m39iTnC89Mmd35LwcKwq8+f0oonPmEGSv5nCBU=;
        b=qVj0GVLSfj9dlWUdGVzPpPvIEvdyHdzXQEgd2uGbzMbWAimZ1uT5CK+akRDmrtAkUo
         9FS0qTrmur88L5dYL0Bb3PqT+Ta52yO4FbUO2YmtvNTSmnDsdZjzmbWu4eoyBtDWGz1U
         R16k04KCmmdYYJnsXcGx3koSvARwIXEU/d2pUG0Oa/8dsb8kAzYdQTQbusJs+W4VwjnU
         6b6dawi290xGt2RsLUfFUX8nocZU4kYFM0Qlv4x/uJZ3ybyn3uyMJX0sAcnnpl12wemY
         Gxy+S0ElJWzJMpZvqrAclZjfALgdaxa66ucAdmncpqtNVZVBCTDwDzLsdTOZ4szY4ptq
         nDwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791301836; x=1791906636; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVTf+5nPszzSOjjP6JGia1N3BVw0TCy5I1d9nkz0VXs=;
        b=TZmBorBfXoX0YKHGlvKoBUVR+BSlI3D2BuuC+jW81KS2OXQF9ugCCevRUgIFwiVe02
         lBDedKCyXvnd3eRJUIi/tzesttQsFptUiIzOoHX6xhiIbJ+Ak7BpvaEGk4bAprO/7daR
         lnVwJrF3elHZvSpi+/wfAWRQDRQwFDLPNNA9cvPZJwg1AZkMa+n67LfHldtHKhVYDkka
         utdzosUT6AP4yKMpJCnp4Ztom+8EyCHMIiG6Bmxnzsceil0xDMmAu/EAYWxx5XafQxKX
         N2tgmYoB5FDgl4YplmVEWZVKFRDQ0HIEmBX5pX4qX7b1FjF9hGjdkRqLlVwdNkzLYTMO
         IEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301836; x=1791906636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVTf+5nPszzSOjjP6JGia1N3BVw0TCy5I1d9nkz0VXs=;
        b=xPetmklHy4odto8916iBSgp9d/4JGS3Uly9VvylDeeByVZorb2E4Uu94WrMTNwig6n
         x8c7JuE+yfwaXHOjP2nQGbv++EpHUItOra0ypsIKdX7nXC/1tbqyG6mr8INaz7757pln
         7hyqWvLdPxBhWYnKPt5nik+8sPR5yN5FxsGGeGtXykM/zNuPHb8rLkIC4JKiPO9SGyCO
         nxavZ76WmanqdI+/9EezhnR/xlaKb6UzV0xDMg14/ErDM3bhDW1RtavA/irxxLTdEqUP
         ZQMLrZ3C9VUqZKo+4yIA8nCFbHYgiELHveidkWvXePHazPm/hSKiwwyR6ygIlsBy5w86
         G9zA==
X-Forwarded-Encrypted: i=1; AKwUvBzFOLyUjUr2IWnpHDczVrK/r/HoKXdGF84LqX5UOPAX1JQPlZFZ+EdONgEmCUKwgv/pIJ4lgnDq17+cswfgX+3s@lists.infradead.org
X-Gm-Message-State: AFq9FYI5zIaq7BVM0z9CS5KRKmh+8x4PNNTSd44BwSL4Xt5SfdFb6xCN
	eERl3w70fqnXyUl68NDlJ2ek1OINd7M2bp9gBz/5uQtUoJB71X8p0AIRwr/fo7JMroBAHtoxJj7
	AXHyWl6FdmxLabqEDnR/Drs1P5cDouzxNQMscyGjMjw==
X-Gm-Gg: AYBFou3I5qwzempcmsrdddqCQK+oX+Llrp9v+/5vixO18jVhP7buxLYPJ+tSPT2c5tG
	Ow5Ig6LzvzNs5HSH9jvh5U2PzOdwzqI0Rx4tIEmEQjC2GkhfRVOzzKHqBFGrRfS6H0dLKJVQhLj
	GgXb+HcaKCDkNcF4tdtrlviuMC6IJhEKMSa3Ylp2VksHMjhsRAhhDdqRz/Rayx7j/A+EZOsy6SA
	S5rsZNLLmvkLKU1+VeJxfItMqM9PxZ9GlyT3pVClHvkOq9TnSYtsbw1zYM8vgCNnMohtXvUH+4X
	1bfJVdKbxeONj++VmERijHZv+JkWbQDmUeVBEy/8OD5xJL8IvDXw86WQOY3c4d/zTgijPr+qJSH
	CiI4IHDE1jw==
X-Received: by 2002:a05:690c:d8b:b0:870:107b:6359 with SMTP id
 00721157ae682-8ae94cb498cmr52594837b3.15.1791301835837; Tue, 06 Oct 2026
 08:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
 <asQcQIh56MV1OJur@lore-desk> <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
 <asSb3RNcityVg6ia@lore-desk> <CAEev2e8c6hZQQom6NV-URgdSoWiafCcRR3BtA6yxxqy7T-me8g@mail.gmail.com>
 <asUGoxyJWVcsYBWG@lore-desk> <CAEev2e_+Dcj60Rj2+_UD=3_kNQxLK4rmWTGK-dr-Ve9mGJBARg@mail.gmail.com>
 <72e19e46-3a14-4a07-9b50-01e5480bf1a3@bootlin.com>
In-Reply-To: <72e19e46-3a14-4a07-9b50-01e5480bf1a3@bootlin.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 6 Oct 2026 10:50:25 -0500
X-Gm-Features: AclHuK8RliQGPhyySeVwku8FmQeRKVliSgaQe4flxxpUxxtotWhsC2bRW968fZU
Message-ID: <CAEev2e8JDjU6PdV+5PjA90YqiMs2bskLhNgs_gAp2AAY1quMWQ@mail.gmail.com>
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_085037_294017_6F43FA89 
X-CRM114-Status: GOOD (  11.85  )
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

On Tue, Oct 6, 2026 at 10:28=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 10/6/26 17:12, Anirudh Srinivasan wrote:
>
> > Maybe someone more familiar with this board/has used PTP on it before
> > can help out understanding why this is happening. Maybe this is some
> > issue to do with clocks.
>
> Good point, can you give us the full dmesg log of the board booting ?

https://gist.github.com/asrinivasanTT/d1b7957cb6ec7bdfed66af5ea3a84631

Regards
Anirudh

