Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46454606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wsr9HBIQ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c/DM/FsE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VBhCL9RW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=; b=wsr9HBIQr8LqMX
	GBAJo8hh6yMhP10CAaoUTPPru91rZDPN2wLkFcP8lrSHMfP7hljWJUeb7y3xFWRoKSKW8xb4VHIoo
	zuxSnq/kvETZ28/wYG5rWCUma4k6HV6cvbQTeEROooTiTsY5Sx5lGLPhhQR6LcwpoiBsC3dNAMFM9
	ieKpd5ItcxJfkRDdt2zdvaFsTOlsbs0JWC8VWhlGR9jxmc01Yu0MISrUFjcKtBhVJqlBoTYiOoiIR
	+G8XGooTNi2o34XeSxybr6Mt+NAYWz7nHDoCIZoYACedjZMlexolGgYN1csp7iYRi1hrUE7ZhZC5n
	L2DkncZ/XayhL2Vl/H2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmyE-0000000BmaT-3SZS;
	Fri, 30 Oct 2026 13:48:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmyC-0000000Bma9-0fjL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 13:48:37 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG4ZJ2072280
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 13:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=; b=c/DM/FsE/PvGatCB
	uHka36ASu+RBqlZXDh5c8v44vLCvMz2Fnr+EuIlLGWP2mMLccbfKE+cOMDb3uuQz
	JtFSPlJv57t9N87udPL5JGi5jaQVD37tfqZsJVQSJzfgyp9yKJpmhaJH0pT2ndzF
	S7A2M1SDtNhxRq8PXeAw23yGyoLTMp3sfAWaCWi/ZurIet2YDe0WmR68qfxlJ+XS
	bgrGbP522PgSkVI85u73Z60H3ULAg2bgQ8e+a75pK4Dlisjw1S9yAkZO0jRgNEex
	ZY5Nrsi/BKmyhc49WC5EQl+1lyMzNnRdz1I1yn9zSusITE5lyA0PEOH9neHB4RVX
	BGsZ1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p3b9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 13:48:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06750c74fso628300b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368114; cv=none;
        d=google.com; s=arc-20260327;
        b=conAseVmOx7tzCIcLQqu5BMzPlrxUxIk6A6KUgt+7VylU87ujqpSD0kDzUlnXh3rR5
         +5cop2WsebPrd6unrckJRPaqd/LO6MCYEPLnhCPGaxzdCeQ/QR+4BgljoC0/fwonrefU
         lX9+xLXmhBFB9dNpsVNm+vdtBHHq4fWNciuGAOFcirpcJ2+tJa19Gs0BpMpgwOPcwYnm
         +Rk0U/7zTnxSBnkXcIU8dPSA+f2FLX/oITUYMeKXkyf4aG2e6s5GTSudHHVCVNiQJyGj
         MzpJ++YktqT6xu4VFZ2E2lgagjpDXJZd0sderycCjGonKYWnOXlhlmdG0d2+0CWDft9K
         NwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=;
        fh=7eleN9jsd2yfdzEdQlxPHqmAOEU9xFUPlaIhMwhpIIw=;
        b=MNZ7JDPo5Rv1j+WxfbArVKhN/CTuCga3TICeUSVq29+C43M/EK2hkOLETSEeivZ4df
         EojvYN0fjQ47Uiyhjg7JSvTeqKm+dbyvhbfn9CFvPAi3/fPaIfWBsJBW4HMfGF6v0mAw
         g6qDOQOyKdLbl6HMW7fizDhR32//5xrkBZsXPJ5ce0x2KX79/VvhySTSSJ8fjQlOx65k
         DsH3DHRLAXABUGkHOUHPvLr4rIXJX9MpIYIqsigIySem7UwTLTpMBCrSDlyk9rS3JtjN
         JoXctalyYJ3Zw3+9Kqu0JS32XmK+TcKrewYSsoJEpkDoof8TeBGqHOOwDE/i2IAhspWJ
         eaRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368114; x=1793972914; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=;
        b=VBhCL9RWKCUXnvRRu0s4sK8ln0q1FKomVmeUVYku5h30GOKGWbC5Ru8v7Vb/+zT7hF
         RN+mQBZEaZjLHos7TCtB5Kc6DrEmOxF9p6779wOHIdWeoDnlCRrD0CMB7E8Kj5ksn7gn
         l23HfM7DHKQ02khT1K3fX0HqSoaei2+sIYRbld6tvl9myGti5g+jRA3bGNFjBqPolV1W
         icZAa+ScNv6ca+2WbVUJG0iikoU/GhIVhg2GgM5gXR31UFaDMKRXa81wBkCvcG1hQyr3
         iMSqB1pslZ99/UzDl+URJOqKrgFGX7gfuL9PE/WS6b0HD2zKm1VYtbVshJx4SqQcQGb/
         i94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368114; x=1793972914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=;
        b=dffbALtduLfnVOoqkl+4jQJpuBmvq/GBPwaQcl28Fs4HYBDXR44guk4Sdg0EtLRHEX
         WGNKQGgkwJHXy/PquLGcUJbCxf7LdkVH/XPg7ybqdzZWnv+oi2RgOdr/KBqwMGsumOqt
         2n93d3qZxQCXw54dxZwNPYzaI7TKjD0imh1nKVVhls8YBxsCivRN8WRTGt2rpiP21bJX
         WL6qiIExXDrSv31+Sr1p+XDzSQ08KFkWjx0EStaqpx19eobZjIACreQEzbRrLZec5w8g
         6I5Py++QrE9Lz721AW4WTtsIsUPmeeoNvXCr464H5lmX2Oe8GepvqJSXN7vQ4i0GZ9p5
         5Wsg==
X-Forwarded-Encrypted: i=1; AKwUvBzQYGRY3s9QBlN+k+3vXsQJoCs9NInogaPUA3yG6G24hmvA7VegVOqf1SsvG+SyHQoyrjP0+SWB9VOj2FR8/PFl@lists.infradead.org
X-Gm-Message-State: AFq9FYJT3zx3DeSqzQaNQeCiK40vh5ym+gE95ujDWlMjwRU0X0Xl/THd
	wwiwL4amlqjW+NcNrPAI8eGYhND23DHXFJdCtFTgtj2pV1vIAe7lwep0E2kyOTTSCoPfkoqMxSc
	haPPluPiNNQ7oU/GdkbqdAyjF9aR3XB5vdYJGJ4Duh+MTYUjvmgsNht3lGWojf0OhRoemD0HLmi
	KxYAheM4rUL/IoqIIUUQZOyPSpP3Mi/fOY6dagRvkbYuFZgICyeo7c
X-Gm-Gg: AYBFou0VCpOdi5xEtvZzTpM9dezsy/sxYSjtNL6mbXGIIQ+5+N9A905Bk55AeItiUGH
	bWAV4NQBmMwKJJtu5lYpg/vNdEi2h2eDafep2eWcT8jE/slff15Bi2MC6UipNrdZWNg2V9Q+z21
	5YFZp9HeiAjAZXgYB+yBI0xD8+vQaa+AAq6b6W1uvAjmXtDWpIiGMtS/uKGA==
X-Received: by 2002:a05:6a00:419a:b0:89e:e781:eec8 with SMTP id d2e1a72fcca58-8a9bea6ab26mr1853277b3a.27.1793368113527;
        Fri, 30 Oct 2026 06:48:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:419a:b0:89e:e781:eec8 with SMTP id
 d2e1a72fcca58-8a9bea6ab26mr1853252b3a.27.1793368112912; Fri, 30 Oct 2026
 06:48:32 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <179318778660.81375.11263258280496155344@manyhobbies.com>
In-Reply-To: <179318778660.81375.11263258280496155344@manyhobbies.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:48:19 +0100
X-Gm-Features: AclHuK9CCkGJy9uu3I3U-z2HN0uRBI4HDWUAxzxMZ9SG5mkVVBtQ_beC3L-ge70
Message-ID: <CAPx+jO_VxJctXCZMVdzeq4CX-Ru7ACM6=wQ7GMdG2+4F1pOcBQ@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sunxi: reset the controller after an update-clock timeout
To: Tam Do <tam.do@manyhobbies.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXwt2hMO+9Pb1F
 IvPgxbXxMYcIpPMPG504lPJDvWC5hQpQk8hatYF6b4MMPvcNk5M5jnMplaRkL1pvOhOP4KEeat4
 sK2TESJYmY1lcDnRN1e6UEQIIRiR+ak3sIaWixfbOUqMt20TpNfBN1dbQzbbBRzV+7N99Zj1cO2
 s3N8VyAdRFN1DO/01uP24ZBwS/GGGLjTyFnOfBU49dpktwKBgzDqKtOvws7H3E6LZnrUfsFb98a
 0d16aY616XJrhZf+X84pjW6zLuLoKOMlhR8imI+In3M2z7Y5XBkxyyP85/rDfw4EboTLKJIyn9N
 bT34kQnL3BPW3DH+kWmOL7tb8+Ihdm49uUIFpQJ6Hx9AceuClyAAb+MXgU1pduV8CnwPWSQmPwq
 XCPPTbIg2w/zVAv49fFGX16nF+q/jAgBAym3EZTQMe1c/oobOtUtQb7gebXX3r3ynIn+MfC+WaZ
 nfIZ93FxgTeCFKoCE2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXzO5vBsnx3X/1
 COCPnqOT7GZIsjOnjZuQbRxq7m+qmbQX4K84uJMmZCH3O6ZLxsT2V+YJrExuqFWKW0H+LzsysjM
 0Ac+DTduwfTPyJhHxNvE0nuiQzI7cOk=
X-Proofpoint-ORIG-GUID: Ex1gsYJG7vLKDq7D2yilIs1uG5K2QCPj
X-Proofpoint-GUID: Ex1gsYJG7vLKDq7D2yilIs1uG5K2QCPj
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4a032 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=w2OPf45SAAAA:8
 a=BQrJblB4Y1Zt2l009CUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=-iXIJKm6ftRzmWoHelNS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_064836_315128_4169C99A 
X-CRM114-Status: GOOD (  28.68  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 12:43=E2=80=AFPM Tam Do <tam.do@manyhobbies.com> wr=
ote:
>
> If the clock-update command times out it stays pending in the
> controller, and every later clock update times out as well, so the
> card cannot be initialised until the next probe.
>
> This happens on an R16 board whose SDIO Wi-Fi holds DAT0 busy while
> its supply comes up during the first clock update.

It would be nice if you could elaborate a bit more on what goes on here.

I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
loop in there that times out. The question is then, under what
circumstances are sunxi_mmc_oclk_onoff() being called when we are also
waiting for the SDIO card to release the busy indication on DAT0?

>
> Reset the controller on timeout so the next attempt can succeed. This
> runs sunxi_mmc_init_host() with the interrupt enabled for the first
> time, so write REG_IMASK from sdio_imask under host->lock, as
> sunxi_mmc_enable_sdio_irq() updates both under that lock.
>
> Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Al=
lwinner sunxi SoCs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tam Do <tam.do@manyhobbies.com>

Kind regards
Uffe

> ---
> v3: take host->lock only around the REG_IMASK write in
>     sunxi_mmc_init_host(), not across the reset; v2 polled the reset on
>     jiffies with interrupts off. The return value stays unchecked, as in
>     sunxi_mmc_runtime_resume(): if the reset itself times out the
>     controller is wedged either way.
> v2: held host->lock across the reset (not posted)
> v1: https://lore.kernel.org/all/179307312104.39863.12372814163472848752@m=
anyhobbies.com/
>
>  drivers/mmc/host/sunxi-mmc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index fe4c0f6d73f3..55313780d06d 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -322,6 +322,7 @@ static int sunxi_mmc_reset_host(struct sunxi_mmc_host=
 *host)
>
>  static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
>  {
> +       unsigned long flags;
>         u32 rval;
>
>         if (sunxi_mmc_reset_host(host))
> @@ -336,7 +337,9 @@ static int sunxi_mmc_init_host(struct sunxi_mmc_host =
*host)
>         /* Maximum timeout value */
>         mmc_writel(host, REG_TMOUT, 0xffffffff);
>         /* Unmask SDIO interrupt if needed */
> +       spin_lock_irqsave(&host->lock, flags);
>         mmc_writel(host, REG_IMASK, host->sdio_imask);
> +       spin_unlock_irqrestore(&host->lock, flags);
>         /* Clear all pending interrupts */
>         mmc_writel(host, REG_RINTR, 0xffffffff);
>         /* Debug register? undocumented */
> @@ -688,6 +691,7 @@ static int sunxi_mmc_oclk_onoff(struct sunxi_mmc_host=
 *host, u32 oclk_en)
>
>         if (rval & SDXC_START) {
>                 dev_err(mmc_dev(host->mmc), "fatal err update clk timeout=
\n");
> +               sunxi_mmc_init_host(host);
>                 return -EIO;
>         }
>
> --
> 2.39.5
>

