Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FFFCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 19:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CjYWfuw46cQGe2he7C4ADsV/syPYLLl4cXDp18Yd+4=; b=q20+OdIwmHjaxi4SXz+OGAoo00
	5ryY9dLxI+rL+KFtOvViLQfhN1wYukY+w493f0ZWHqNY3iyv47nwKErTD9brWJLa7lUWtPQbCrq+0
	BnqP62gJlEzAO6j+eD0rzQ91ZTE5mcnd+4HSR+BgLt7wdCmbzfZAJtzh26xhvxj28FiVVH4g4vK/1
	JJeI6oTumHMWWRTCqHNYAJ5juWsdZowBTSQyapxf37NmuSN+dlTmN+dqxdnn4RoqRY+HzflL2qoOq
	8MBfspfI32SyK2IKk55Vjn3t03ONYr/2fUzn67ADdm92zvIAc2kiQzOFUKsb7fgypo3LP8ya7rUSQ
	ca875ZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUre8-0000000FmR6-3dAe;
	Wed, 03 Jun 2026 19:53:00 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUre5-0000000FmQa-420o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 19:52:59 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5aa6cdebc33so3419133e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 12:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780516376; cv=none;
        d=google.com; s=arc-20240605;
        b=FPdSJ3eU0C9EXCiWjaP219/dZX2KY8HJ//ikVUr32U9qcM9ORRRUoUcIybgEFnqTCi
         SYpHO/8SHkz2ypwlEWl+Qi9nd3s2KfoeQSNdwKo/f9mp9UWypgOXq+PIWhEe+J2caWA9
         H2PpGrLSXhhpK1kneZ/HGeobbgam7TwbBLG5mmsRp+A5/6I19Dgb3PWwlvZqnNKGDzkU
         W72BP3y4z7wUz/s+FNmGc0PmyIrHNofpjMvO0LP3iIuUQFjmoEW4BkY0QmbRL70lB+RV
         /UtxNDfxHg7Dz3taAPVcEdo2bK5Si5EPefuc2F8c4l98A5H+CfNHnDsMvpylJC6VmM7h
         LPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5CjYWfuw46cQGe2he7C4ADsV/syPYLLl4cXDp18Yd+4=;
        fh=uL2zloJThhsNHQjzlmlXTYP5DgePnP/k4/enU5K+y40=;
        b=XM74BLr1BJ/zSEvGLbhfMEtT/pfJeeCU3jWFwvmuv7nTfU3uwpxGLHsmCOtWr3zlut
         F3bbllYHyAyxaF+RaBNSt8KfcwDHZG0gMuRAOfMVyGBFyBWR+t4aGqrNeVoL5JNpILsR
         SLULWNmjpd3d2IWOnmbQc57gwXpWDXEOUzDghb0uRSfZKMVTVKYkf58kW3M5JbckQlJq
         kzf+NpLyJRvumtC1gfatpuAYgximv1Htc6vO6wO0UVWKRJd56wumwqjbajF1NNcR0dr8
         dugOd18mq7Af9IADXOxCHtMJVWU+984wTSBh/ij0rXKiOUPwoc4s5yzl7iPMgqciQpb5
         HJDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780516376; x=1781121176; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CjYWfuw46cQGe2he7C4ADsV/syPYLLl4cXDp18Yd+4=;
        b=W0Ts4Byf4uIw9kSDJWYmgD3ck1vfdSQmcvHkRFdVXJrWt7R3fwZntVlhBoCUi6+RlN
         20GVl5NzeAPGSHDmdab4c0lTnG4Th6D3ifPF2Ng/CmfIpQw9L+/iomQhuN+I0cQh1Olz
         qBTz/UHacXMvb6iE7inNkqNv+cppG0d3HxBJNuEkUwun7RXMUgiEXqsctXcCfw+0Ksxi
         gGfJozzQZCWvkTwzpvI6TsYJ8nDKZ6hP/9utxdqsUoFq0ysU3gCSOyTXoKu/XxanOIMS
         EpkgNCZ5lKbdP9TxtqddICLCBpD6Z8T+AkxeSoS4/feLgNdtme6Z3GozNNmefevARBFP
         I5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780516376; x=1781121176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5CjYWfuw46cQGe2he7C4ADsV/syPYLLl4cXDp18Yd+4=;
        b=FopYlGBbmrkfyH7A09wy3pzuKKMZFTnu53Ee5lqJ9DG9RbKInzds6+IorBcOjEUWtN
         lcehS0hVgdK4mRBEZF67j/f6oO1EU6Ktf3eKa0qbbe93Bs+LqHFicuc1X9+LVYIVWH/e
         Sxt21NNQKXy862M5TWAm9NVDWx5I3RWeIXCJO1e3b+b2BVLzoO8xxKIOAccOrb5/qPzG
         wW6cbGDFvPlsBxlN+Rf2s3kqs9Nr67F3OYLeXdkyknmMSc76OVM+AX/teG18SHoGY3zj
         WYxNmxl1BVKP2lXTu69xW616J5RjBRCwaUSO7fcxAQ7ewF9nSIJQQFnJpcnHHpumFsR6
         T9Vg==
X-Forwarded-Encrypted: i=1; AFNElJ+XC5cYKfU8IPgL6B8hIh+Dr2tSWlzV8Lzv/LFM7wlXVrYLPORpYlwsyfnwTeO17Lg45S2PXVuYIUbKaewAoM8i@lists.infradead.org
X-Gm-Message-State: AOJu0YxUGfuey47zyLPKF6JZTlhfOTeei5E/sqFKxrJMr2Qp4estWGFE
	VEj/1K7oiIdIouTXUX1f8dQXJt3n35xKi1PQqEhC5MAVWMoCvreCf01TYAxCfT+hW6eO7kltKLm
	OHJB2DLWx4L5Zh1apqVobnqs2wYC28VY=
X-Gm-Gg: Acq92OGTWkFWJdBZiifhOmp6nT34qNyE6IxkfdHrGaGnReah3stGy84SSVKZbnIRLS4
	PqhjZQMklkCWFNPlVCXS0bU1ly0dkEEql7c/UfXhnExeWjR8P1MoP8v0psFsKZzoffxCTO9rCP8
	ie4J+g5QRd5RP6ccHYj7KdszkzjRcNSCZnmKAh9VSP28qedDkEw0hw9urK6jJG5zEk16bWktNwh
	wbwt3tkgxVp1+Hx0biqkNCPkqNYyi8mcPnELS6AY35wqdoFWM3/NQHrp9RgcnBQY1g4MogCgK5R
	YBLeVjpiao044OU4A67Mid1KulND9GzU7UaJ88HoChJJeS18g8usYwI6TU8OFMfDtRAQ4KNAAk2
	SatFFminZ3bMg3VqKzfCtVgHoftLu2FeHL/giDpbkFLukwSEo8uAwDr/GVX/Is7+XzAYS
X-Received: by 2002:a05:6512:10d2:b0:5aa:6a83:4dbe with SMTP id
 2adb3069b0e04-5aa7c0af4bfmr1548683e87.16.1780516375512; Wed, 03 Jun 2026
 12:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260602035717.623208-1-rosenp@gmail.com> <878fd338-b4d0-4e46-987c-5a0ee52989dc@amd.com>
In-Reply-To: <878fd338-b4d0-4e46-987c-5a0ee52989dc@amd.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 3 Jun 2026 12:52:43 -0700
X-Gm-Features: AVHnY4LRsE2jv5lCvhjKQ2mfUtc8xNZTp8J8_S3W6GCVeMhXFbrDmadR2pgVY3E
Message-ID: <CAKxU2N_U=Wk4f9ankopVBMRGH+YdTn8FOuyoDs4Of04o63bTHg@mail.gmail.com>
Subject: Re: [PATCH] char: xilinx_hwicap: replace in_be32/out_be32 with ioread32be/iowrite32be
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, chleroy@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_125258_043144_AF618248 
X-CRM114-Status: GOOD (  14.66  )
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

On Mon, Jun 1, 2026 at 11:22=E2=80=AFPM Michal Simek <michal.simek@amd.com>=
 wrote:
>
>
>
> On 6/2/26 05:57, Rosen Penev wrote:
> > Mechanical conversion of the ppc4xx-specific accessors to the generic
> > portable helpers.
> >
> > As a result, COMPILE_TEST is added for extra compile coverage.
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   drivers/char/Kconfig                     |  2 +-
> >   drivers/char/xilinx_hwicap/buffer_icap.c | 16 +++++------
> >   drivers/char/xilinx_hwicap/fifo_icap.c   | 34 +++++++++++------------=
-
> >   3 files changed, 24 insertions(+), 28 deletions(-)
>
> I don't really mind about this because I think that we can also remove th=
e whole
> driver.
I looked into this. The problem here is that there are actual users

arch/microblaze/boot/dts/system.dts

and

arch/mips/boot/dts/xilfpga/nexys4ddr.dts
> Thanks,
> Michal

