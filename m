Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C69C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvqsLA6Mvt2zukd4+gfC9bRp1ifbJzmUNc+eEGzl1K8=; b=LG3OiMYAu7BTDKBMEhssBASEvu
	2lIaUbJtFGBz+kznM1l7N3KpPn4YSiOhngXLAxFnE8KYDMOFmxdERVufV+Ic6igb3zAFgqaPoe3La
	Nvnr6dSKIgWhvDJGpR/Al29C5syh7zKOTbtbJfIL5Rqr/gPtCrELQ2Mu/kgBOkagqNGSNxDYLOm8s
	iMeHl/enu1z9TMjDYbn9B/DMkYgNI/q9UExCM/xJlqyxuK1LhICU/HQ8T1WD+hrr6cul6Hw/5DWCk
	Jo3Q3RA49HY7Xo/1FPtV645sJJnzH5eqNCfJTwfO/9PW1XD6PzxqV7rUPNhtG2ouBYLNClWkXDHS+
	FMY2YbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUF-00000008xoe-2VwC;
	Mon, 13 Jul 2026 11:06:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUD-00000008xnl-331b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:06:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9eJ3t956861
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvqsLA6Mvt2zukd4+gfC9bRp1ifbJzmUNc+eEGzl1K8=; b=DxuR6f/bxOGO5KQB
	RZ/enNONz0Rdsd4+l1m31TX0ZtALLxRB2aZZ4Bvwlq9otL0CjXf/HxHi+EeJ+DGS
	woR5CIoZx3YpXBtO0ZjEUFav2Ih1xlYDg5ps6CJ672D/7yb8iIDc9Nw6olArMEHV
	HFsPQIxyZAzd4upN/mTsvRorElOr6ov8OmRtOK1E3b2upECnWP02bHAN9sBFQ5pP
	XntXO7Wkgc5T7ENe+2f3GxoX5n/BA5J1SWLQLV6d37F/sG4cRmdHS+slqQgLEAeP
	KuSI2ENJKzSPaK7VL23lN3pbrN/RdCerPnUzXEudqwmP7e7QG1DsJwAxPHbIwF8N
	zKPiKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9r9p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:06:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e7ee64b25so387022285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940768; cv=none;
        d=google.com; s=arc-20260327;
        b=OR1t+34OlXgJGY7iTOsFXhgVfBvpkMt8/3WYIbR7I0UDy+ROXSfyEn6c67Bxucy4O5
         SCmyRWhLjOqgZflLenOE1hUgyBEZZ2DcJrMeW6gylCJ9GsCJuC/QzQ8BxErfOKaQVndv
         MD02v7h2w4iEGVeZ3CR4rMPYGCU4IX0MK6lC9dfQ3jOERPX66PhB1QV0z9a5CgzBZaVq
         axSPZfPEZEqg6GSxLtOD9zg1VJaMsCr749eWtFPhJsnWufklU8DdEL4q5lFzEN2Rso8Q
         iF+K3vfWFtg6bP8iU50OMqVhtiZ2fVf0sFcy4gCKHV/lqV+jP1kKLGeeLbhgItGWCRQ+
         iVAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kvqsLA6Mvt2zukd4+gfC9bRp1ifbJzmUNc+eEGzl1K8=;
        fh=H92MkcOOZ1tX9LN4CmQ5wrrN79fD1/vLJk0mXlLu9X0=;
        b=jcVhHLFDedFsn3Y0WEQOupa5qRKT1hgHIJn7AOdM/cU7rG/tG/l872g/YfazRPiaxw
         p/f6tyYNheR41u5pwA6MbADGfieNIznlPeW2f8c4k+D7CtParu7fMQtTyFiDRoOZcSUe
         tgouJ9mRPyrUSKWpLVreGdeDiuuJfBMYunlTKNw/xxOxRnBe4blxOllJ+4o4eocuU9PH
         ljhUqPf3o7lhVnRLAyzqN8+5I7OmgYRNSDpRPnhU9MO8qhCx+jAwOlA2m3vbMxLprmBD
         4BuSOokxc5dqcC3dSYeY8Y2JZjpUevCMPVW2C2syoJeSinzqFsoMvTdLsYd4ZWl0ERX3
         xUFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940768; x=1784545568; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kvqsLA6Mvt2zukd4+gfC9bRp1ifbJzmUNc+eEGzl1K8=;
        b=XKF5NI1+cLyNZm1bobozGTjur6lyxS1ZYUp+UZRn/KYF0Z2lLTaWwJCalNxeJN5LwE
         AFO5oYfcP5KcxnurK2JJTXTzdJyMyI/blWuEMXP2ddZ4QZjnxaI2HFYK/AnpKGFG9Ga1
         UmcJHu52CUfDtwG+3O0elBR6I+utBS7yesmXNRH5itYhzT6J0LGzuZK8xHHnrca8UcPp
         szI142bWYjnP2wVQ/lOUhTLaVDXcGu8ccX/d5SxWV8xYOlWZaaFJRpyd/plizrfWVgum
         kUDdT+pwxfVeAuOj/BRcjO0rjuLDvVW1GLRekESsxIc3dEz43cmg62z+9ugz+yN7//W5
         H3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940768; x=1784545568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvqsLA6Mvt2zukd4+gfC9bRp1ifbJzmUNc+eEGzl1K8=;
        b=GE5ws0zmWLZ3g3Yafx1Tk2V+1j89wttFZjSMOBhCnk2/MCgrDoQ2/axakUykMwl45F
         0xi1VaawbApnKiZd42uKk0xWkmek8Pfta7aMKhHy3CM43q/iNb6RTD9M+NUC6+60k8ym
         vytywliWTOlJJuqp3HgszdKHx2yu0cwJZkfUvkza+a7j8XwBEV0yI1Rp4zCGFuehLML/
         qDuGappuC4g6ZZdbcpnJdKsps+4Dx2DZPAgQGfBIn/PxgCDPK5lmFaJJEkCBjr8jlNBE
         VcKyF6bXKm+nSYVtuEy9nqlSZpEX3WVq6Fa93AHXM1AP6iDP5VrXo1OprOMykd25mrph
         YB3g==
X-Forwarded-Encrypted: i=1; AHgh+RoC43JcAyJu0cW4wLhcDOQRr02EfQ2n9d4TLp0eyK4NL6j20y89+aWZaC082+CtmW4EmYVeYxMmDsQ9qGBqH0N5@lists.infradead.org
X-Gm-Message-State: AOJu0YzMkMSIyXIau5twi9lr38mluiKBR6Pgog7ljJA00HzRALT4FzW4
	jGnKnlPaLvRk7IrOBgAuZHXldbMfY/ubXUQ+xLgnGHbf8kRvzyghl5PVPiX389oIM2IXMENPzl1
	Rl9XgSgWimXVUYecopS6VTReCcyOKATrFPZjD8oUci0bP5EvoYfSy8idqb805qd5RfgOfPZ4nRn
	wSQZg+gOHKdzqm7qLXsGa2M+fNUoifKakERtkc9uxlhS2R40cfTAOW
X-Gm-Gg: AfdE7cnITX+HGsglhX1adyLY+YSdZFpYh2WAtjExCHzSWjr5P1K5X6EuZb78X229y0r
	GHfn/cVUZakFLYyrGD8BYP9/sIvQYAWiLyjsC+YJ61WMjWZDmDDflEhWtzlpM+b6ox84EOiczRI
	eL5sQgKF3MA5MHneaci+mILfVOxZp49jQIH4wqMmQolwbt6N0hcLnqzautS6qkt8aMKq82
X-Received: by 2002:a05:622a:4cc5:b0:51c:7b12:1210 with SMTP id d75a77b69052e-51cbf34c183mr86772291cf.78.1783940768068;
        Mon, 13 Jul 2026 04:06:08 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc5:b0:51c:7b12:1210 with SMTP id
 d75a77b69052e-51cbf34c183mr86771971cf.78.1783940767679; Mon, 13 Jul 2026
 04:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <a9a082c25e4bda4d73b261eee951efecab20612d.1780499882.git.geert+renesas@glider.be>
In-Reply-To: <a9a082c25e4bda4d73b261eee951efecab20612d.1780499882.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:05:56 +0200
X-Gm-Features: AUfX_myYmQelNutM8s1zx4fXjQ-IQeu5ofDTxXjw8xb17nMcZM8N1mjOg1nEQTY
Message-ID: <CAPx+jO874b1EbcPF609NzZMCXaXQidA==eV1sgZzMde7VbvXKw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: Grammar s/may needed/may be needed/
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX8jtvrDxrd6Wu
 ddaf94yhy/nA4zuqZgx0LbMcVBeE0YDhlfpPGEwfjTp3/24FUDSKIeSA9+EtUECHk8H7TSpcHWs
 VHSaiVDEjo82XH+ESVIZdUFhwHkIv+zYFGwTIgX+H4pB+Tu1vVWavXzUhzAzGbQiaVCwjpG9pi+
 oowNc1HS3A1bbdgwBigyqu7Z8cvItwOb6k5/6M5UGkZcInA3u451uXQSW8AG9vNvvRRXqVVWKc6
 GYmPiKRDz6eNg3FFeNHIFVY9/J54WOqKB6K2g5W4J4CI8P2zcScLMtxLPDGY07bd7LQ8KeCjPMH
 xnKTBmNh9C3sIG5FF83i5ITkOUFC5BY7C1WAN/91i3rpHMZ6M6VbiBLb3jH6wMPIibcv0f57T82
 dsADSBXKLLuih3AFzqLQCysJc6TTI4QiIzu15zlAcEVZbxrXyTClNpb140pKM/9ZzCTovu+z34I
 qGKvNfkBVzBlwl5Oxyw==
X-Proofpoint-ORIG-GUID: KH01iveTuMDgB2FNG21_0g7ZdXuaMmRY
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a54c6a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=hUYxl28pOwIGcUTX8NUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KH01iveTuMDgB2FNG21_0g7ZdXuaMmRY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX3qLMogU3V+Cp
 77RnQIaqc0tnJZ9yUUCHtfcionJSWtJ73hhceT4x/1T0Kuz5Q+3+vGOg4oJQ6SpePeEbGOLJbty
 4jxUXXFQw3zK2QC6g3e2X49EhOkDxgo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040609_879338_F52CC007 
X-CRM114-Status: GOOD (  21.08  )
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

On Wed, Jun 3, 2026 at 5:23=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Fix grammar in the help text for the ARM_SCMI_POWER_DOMAIN symbol.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/arm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/arm/Kconfig b/drivers/pmdomain/arm/Kconfig
> index afed10d382ad7f66..ba0b190a63d6bb18 100644
> --- a/drivers/pmdomain/arm/Kconfig
> +++ b/drivers/pmdomain/arm/Kconfig
> @@ -21,7 +21,7 @@ config ARM_SCMI_POWER_DOMAIN
>           enabled or disabled via the SCP firmware
>
>           This driver can also be built as a module. If so, the module
> -         will be called scmi_pm_domain. Note this may needed early in bo=
ot
> +         will be called scmi_pm_domain. Note this may be needed early in=
 boot
>           before rootfs may be available.
>
>  config ARM_SCPI_POWER_DOMAIN
> --
> 2.43.0
>

