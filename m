Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37469C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=; b=kojTpqXH7Bv4dh8ogU231DQjN1
	Q4UZ7SCJTziZMvRBdCPuP1By/NqjEKnUfuNgOvRRQDOsNPD350+g2ydT/Jh/ow3DdHByApVZN55ah
	uMrMK6XWiarvc/rpyclYJFujbS8Bq0YI+cvBf4WaH9ApVs2esMRMtQ57bXh9GmyjrDNHIvnMjrcKX
	4ITqeHhuZlomvLbLPLpbbXlD4r1x5i1SLCVLsiKzVqFn2FY5SF2q2DPcwzO35cNzahp2DaoVAUOet
	iR518vK05/8SHybAIZbzwolh+/D1vyah0WgOLmb159LFDGz/YRodUF99lUlpQJxML+ku9CfJkryAU
	u0sgEeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Mx-0000000H5f7-11Km;
	Fri, 11 Sep 2026 15:40:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Mt-0000000H5eH-33zR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:40:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm8Mn1090825
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=; b=I3TZVEPXZXd1Os5M
	NrODBZZh7T1xCUBzKFyUjkEAOKX+RRhB0xUdUtqnXOD7wpDfJgVcM0P8ZAzbzvJL
	17AjNsRXhsgYC5/xF3Hz+eo0TceSARvcGYLMIQwqFJRdfdKtgutrri/KzKcvQE7q
	28Rok/kNb+0XzN8xl2dgjNWrDHiJ/ENoqsceZe9haNYmE2I/eUyUlVT2J1t8q6QD
	SLrrbQEDq93v0gaYF4B2SeI1gp521usXrUP7WHGlDJXSRZNOLmz1u4BX4hHyEwrx
	XGTXtD2+scqMlbuWYo/tagR/1XZRpd1B6QX0sGpdvpj23BhXJClvEu8QAj32QnDw
	vQqPkA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3akap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:40:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso18240525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141246; cv=none;
        d=google.com; s=arc-20260327;
        b=YbTM9uulyKNoABrhHj5OryEaLG62jVEuVLohGN4rh14aHvdTBUcRbHL5j0PlVgQDdZ
         6FJa5kSSLp1OJ0pWiFZY16mTxL4R8rdu2MAHJAGGM63Q/JOoJS2YS0EzQkHUEEJZzJJQ
         rlHxQkyk2e3xSZJz5Ye7e5TJsKviQm4uiLC4HD1eQcx1hfU2PtU+tBal5OPLoaSiizkY
         xozT4CWJqwTehu4L7MtJ42z7nk1MArup0IHXOZr5UxGP5LWPZ4SgPki5tDxaCVMpJAyw
         JIbPz5AvuoC4jep1eB0TksdPR6Nt3d8CVCZQoupy+uoX5TCX9kxEFDnXuJK2ujjMOlO9
         Wwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        fh=CLNDJhFlypS5imu30JsjW7gI823qRndEMECiPbXCGMs=;
        b=TxatqushW8H3di0z0RU2QWed3F3XqPo9SnzPdlLhMgceBapO8K2h1HF/4sociAJ1rd
         yK5cWP5r5pyTOmnZmXEnyrRp9YlgRBme0XXC+8bwE1nyhjoCyIb/b0GgCYwkPATXyfj8
         JjOZ5RBinjxwqvX1djVGydQGaDnFerzjoEyTSw5grzEsIwjl4Zae/2gCuJbFOLVFwXbD
         bijnC+nsNkbxzjBTRvheVLRubATHRnqBalmkWQ3jCnb6zwBSMp0h6ZFa4oGxKjCJij1h
         HBKFugM9E8TInrIbWBqHKKhZvYfbkxcob7BlRoHutsINUnzKalQB8xV4eSNAtc903LT6
         F5og==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141246; x=1789746046; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        b=gKg8QoddPqzAPdjorYTa7yJlVoog4fXw2U4PFf6gDxBsbG/C+Ah6FtArnFgPLoLjw3
         M6d5tb68uZ5IZMP6CER6T2dbL52hHvvbpdSFYIPcoNw0qgrU7fJ59mudBixMvpf29Odr
         lwEMXKp1Z/nt5N+HC0ItEPrVsp5YzH7td9QuoOWsJQKaW5n/EpJUaW/QuQnHKhMyZa4o
         j49HimoUjb8WAbzonsy3xqqAR7zw7ej7TH0/51H4nYZPhoFaR5CDBdfet1NXEraWIU+2
         aN3YI20zszvc0hZCdLyHNnU5vaJ5midy8meZvuqNbQtqlyiw+RzhEAKBtSBMy7CX3BYZ
         etHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141246; x=1789746046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        b=WA0e4VBDQJmQa4Sr44SieID6d7INiA1eYEC41PGWwqIEYu0JmZYZRnibjSPyoJLw1X
         GcyWXc6m0ZvnRniHgcULkET0rAXiVoTweo9nFdfm0WGQeHst2LxdE0/Hcbw+UNQ/QRRV
         WEij6N0qEbTZjYbEC9ueByYDcWIH7zP+zgUQ+e3p00EBfpjmivmaFCaU9tasXr/Q2nCD
         PYJVCfsOMlK90Z++oDS1AosYkeyrHlKC4G/JlrmEfKp2H1VHCPvcKoZ23IOZKUAa0g72
         kXBTm6JvA+uoYgzHB5m75gOQH2brEdIvzsDlkX2tZkATwHAPh2+9bHvD7wWnfWy+U1BP
         TLjg==
X-Forwarded-Encrypted: i=1; AKwUvBw2d669BZS3lNZzO4n6gqADY1oP15l/sQhMJks3J0I+71tJDRBFpJfJDG8nR8PwRBqde/ieHVZU3fF8uXr+Dbnz@lists.infradead.org
X-Gm-Message-State: AFuF++lDQSSY8Vp4YnVbywVkjHwqx5aQQ1HLvwhv0lOwGlRcdGZEjq2T
	BUWz33L3FsH7K8DBCjN84Z/WOEJu8YdexGqPQjOEbUaQtxgLCKHDHrkvtk/ERoCEUf7M/Nirvjj
	MKlqcMQyI5itggR68f+S2ZKS9Lg/k7NhC9DgUf9GUrUfVKx6iPrxYnL3G0IgpYy8oIjSZvyylOs
	UvQ0DYJczApqWA3xMIPu4VPhNv8E4ErBPtDZONR4cmh9JuU8zJnHMa
X-Gm-Gg: AYBFou1IB4Y3hnsk8O/CUhDNSoSsotlG8f3Phzo1vMWDXXCd6rL+o4T7BTdQ51LgLti
	GCJ/fI2mwtbLIwjm59f1YTudMSNk1rHez+2Hm4pKUgltctCGJUzBuVbSEieJyH6cbhxtI0hd30L
	r0eYSqMdXPxPClxOxgQZup7S7hq1glgdFYc3tXe2WgHMyUp0a3GzWQQIqZEg==
X-Received: by 2002:a17:902:d551:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd2a45aef6mr95924785ad.21.1789141246347;
        Fri, 11 Sep 2026 08:40:46 -0700 (PDT)
X-Received: by 2002:a17:902:d551:b0:2d9:4871:393d with SMTP id
 d9443c01a7336-2dd2a45aef6mr95924275ad.21.1789141245940; Fri, 11 Sep 2026
 08:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com>
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:40:34 +0200
X-Gm-Features: AcwNN1XJiqHpLAh6BkLXLC9WoOCg1aSLupw2Vf07ULv13DKT3f9hOH1d-RT7-pQ
Message-ID: <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
To: Lucas Tanure <tanure@linux.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
        Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa420ff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NufY4J3AAAAA:8 a=yCDuxKIkwSfSSdlP9cUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TPcZfFuj8SYsoCJAFAiX:22
X-Proofpoint-GUID: eYjKk3mMIEb8_yttNAe_9MYmhgHz9I9D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXxkB+v5uNRCJ9
 82yRMDTCxJ1delllszfgF2ME6Ps64XEQu7K/55ZWoO2zee3U/VnDomhn9dWhoZxXh9SPH5wkFAW
 JkOlP2GxDkwnpc+najFbo71j5nQ4zB4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX2Gzsvx6ZHwTT
 wb+k+x6yDOTMxqWwEUz4HvuRyhvFEMEjrCDquKGQOEx0+Xq20ogrqbzu80y0FtGtKirhIIIpGzh
 FiMynpg7BFvGtK6aYIgH5g6PPJFdjiEJHklukIp3ehBP35KjCUHu6PUJKJ7END/AX03+IiUrOW0
 XVU3S/iM9x8e7DiL+socY5ogVw8dmn4M9bS3605ve0JsB/OW7XVZxcQolVQa3Wr/qpLTT98AASM
 pcfikgMkW9oXYRSIOfTWIs1HXzjkoaP9gp9lrn0/Lxldf8Mjr9X2/VPxFs1/94olcwHSpLoacKU
 LS5meEFMEG1vLQGHsGlVEsI4JnOVw73JQmzkMRnY42BUetQ2hiztRD9OEgXPoJ/bYyqjpLvZyYQ
 IFGnPNbCBmVjQnB3MM/3zdSOKSNglxjt34dpd8f7zUi08PAuWchheEh6/SiWGLRObXbJjPcMtCj
 wNAUV5uRDZ65GAGbN9Q==
X-Proofpoint-ORIG-GUID: eYjKk3mMIEb8_yttNAe_9MYmhgHz9I9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084047_777570_88110151 
X-CRM114-Status: GOOD (  22.70  )
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

On Sat, Sep 5, 2026 at 5:32=E2=80=AFPM Lucas Tanure <tanure@linux.com> wrot=
e:
>
> The previous series for the intermittent boot hangs on the VIM4
> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
> explained, sys_ampipe_nand clocks a pipeline stage that the
> hardware design inserts in the bus path between the SD/eMMC
> controllers and the NIC_MATRIX fabric to help timing closure.
>
> So the clock has real consumers: reference it from the three MMC
> controller nodes and drop CLK_IS_CRITICAL instead.
>
> The series crosses three trees; patch 4 (clk) must only land after
> patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.
>
> Changes since v1 [3]:
>  - Dropped the Fixes: tag; this series is an improvement and should not
>    be picked up by stable (Jerome Brunet)
>  - Moved the patch 4 dependency note below the --- so it is not kept
>    for posterity (Jerome Brunet)
>  - Dropped the e-mail address from the Assisted-by trailer, see
>    Documentation/process/coding-assistants.rst (Jerome Brunet)
>  - Fixed the space-indented error path added to meson_mmc_probe() in
>    patch 2, it did not pass checkpatch
>  - Dropped the CLK_PIPELINE() macro from patch 2; has_pipeline_clk is a
>    capability flag, not an SD_EMMC_CLOCK register field
>
> Thanks,
> Lucas
>
> Lucas Tanure (4):
>   dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
>   mmc: meson-gx: enable the bus pipeline clock on T7
>   arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
>   clk: meson: t7: don't mark sys_ampipe_nand as critical
>
>  .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
>  drivers/clk/meson/t7-peripherals.c            | 10 +++----
>  drivers/mmc/host/meson-gx-mmc.c               | 20 +++++++++++++
>  4 files changed, 62 insertions(+), 12 deletions(-)
>
> --
> 2.55.0
>

Patch 1 and patch2 applied for next, thanks!

Kind regards
Uffe

