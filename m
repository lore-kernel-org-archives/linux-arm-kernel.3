Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD90CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=; b=k+UZ5lzsOcOlDQsHBlXaEGCppo
	Aitfswipzt+jbtHoPxwB5UtZ3DWGHIvdbWkiAXN8s5Y+Or/jACBAC2+J9QDKY26JUzb7P9VVxfoWw
	f2EwhuUccXFGxp1RUmlzqc8WTCdpfiX9L/i8E8AQEcrCDCKLk5rLvwRhu8q4V+t29/8hOvd2Zkc4L
	iRoeymH8fbIpMNoN02hcwlH/B9sGd+vAwnzCfXWhTT3eBrDtTBMKwhA8zfwOu/ll8sRix4VMnVrDA
	up7iRLumvIv/UljZzJhxw7mKykXkYMyQCh4GbWLWvkMCc97IH4dVu3Z9lrijfUxjZl3croxLd4ILj
	O3Y0er9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIPVG-00000005p04-2OgY;
	Sun, 18 Oct 2026 11:56:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIPVB-00000005oyv-3Ny5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 11:56:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5tNtT2829770
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 11:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gcEYZe12IS5R8fbm0oKp4F5/
	idlukA88I/0oldtDxJQ=; b=QvQ9Afmzj/fGG+aeASrcA/JAaYzYGKk6IFlJtbUL
	W5uH3JiBvrYtBFZykDTHD+Tt8jKX4GWEdGsUD0D/CNPcV42pZYoskpnfq8yAn2TJ
	JXZqU5JFzIO7YLkjVbnQ29AjMQkbTeMKVfeGXEPu2rpZDRdhAl5uLx6qU0X/Qxg2
	D6gB8QsP3SURJ9+VxKET818hKXYkd3wIoLVBDMXRbjBGDdPQrFH+ZLYwJUC8r3W4
	yLU/HfKASohkj9S3ANaovwgwu8urHvo1FRMMb1sg4Gdb6QvubeYSQ226KPx3hdR+
	CDGjnlupNYD6znJGGMCNc3Nq9nHEt3gedBst9cjCh/7Sdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bgk40g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 11:56:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso207488885a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 04:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792324592; x=1792929392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=;
        b=YEIAHuTtlZybITOhiupp4EYMY/4ZeSR+V8b73dojhO2opish9cClAh7TewCkV3arfN
         qCd5qmgRlhOwfndSbTLpijsjt1Rgzuo8nbQWNXGz2iEX97ilg/5egXL9h2so7HQ2Iv9t
         ixUazIusYfmHVFLST0J/K8PZd8fWKureRTSgcGqaG23Hm7MdrxvV1sYs1XktD9g2gR/M
         d7mpwc3b2z/XB6mWxyDsXYDXl4fu6HassEKyy9q44i/AoZYlRc4NdVcC9cBoEGMiGCj1
         ygxTlnkYWgZdE0uH6tAVd8sV8v1WVWTbPc7J9DRszM70igzofsJm4DolbXCLWopvSbli
         H4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792324592; x=1792929392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=;
        b=mtztyyUDmVgGYatO88h/5Kz3TqUfCd7e5Lo1cI/KvW3RopwZeI7726EvlftPtFigfn
         RwtVJix2RRgqC+dEgOm/NJNt2De18HZQpk4JiZRlbRiPy0X+EaIXbKduaAjEvHtkpZQQ
         1z9IOHhATQCf8yVT9DVviUy9p8daM0HL2v3UV9ANK5tSx5vSTq8IEpwq5/fr2lCK/R3k
         nQqwT8veosp+fN/9ltvXbSyo7pMFLzaHNTb4gfarPPM7oU+2a1G2oPfpKOnQNOpeR1cl
         ceBy08MLLRwA5uq9ohASmngYXwoHPTq4yGh5MLNbQge44HEZaUj5MsD9WIW7/juRmzGg
         9yzg==
X-Forwarded-Encrypted: i=1; AKwUvBxxV3uecEk7Ii65EaAHyUfDLLsyKNcoj96+NQjb+Gpy/HHTOieAi1XRFqsKaRiJ+541oRUJ/4AyT1RU6mtfKbxb@lists.infradead.org
X-Gm-Message-State: AFq9FYJf9tnpkajkGQf3XzpM2ckf6woMV5HfCz1NtGINYjZqyAlAyYJA
	vy4tpKkcBVGhpRT5xSBKzAwDtGksIWpo4IhTsjl1aVhmum2lcPbPC25RbKcdVnhiAakxE+V7Wzg
	UpI56lWAdCzdzJcDOSrLclE119ukQHDdKdzCzvv9Ob2Upg2sIAfcHXm4A9l0cxBaPvhmgqqTbUQ
	U2rA==
X-Gm-Gg: AYBFou30AaAKfYAAWhjT5hZ26pdeQ+dmYsjgjCv8ykV29wBJ2/IZTNVLBFzUPt0894n
	6iGwja3djFoiimk2yKclXXpJrctlQP0qae+QcC5doZ6AAklM8p0Q0Fo5bHsNRL9G483sr52ofo5
	mgjsi4UE+jIUmv+zurOSQvvEXc1m1ij1Svpchuy1Vm4v5l+Vdk3W7NicLh1Fr673FLbgkyFDEvz
	52TuHMI5zmEOEUzrrx1kmfBcTKJBe1XeN/xiQj6NKPDcgLFYnmXljIEBwZOuW9Mx+YXH+fTLh5f
	alljCEhcPRvZDpI6aI6XAbcVFqsMGdOqxmr907TZ8dHdLV0PXJfQ2DNTr9gPBGplEhiumRbeqg1
	kMO1BoHEJBg5HyJbhqr6ewdhsHqCCYbvrEmbhb/wfJuFWWxH00MRvmwzy/u1tm/gI11tP2KGPYs
	+Lnqn68/m9Y2+y
X-Received: by 2002:a05:620a:2314:10b0:93f:31bb:e3c with SMTP id af79cd13be357-93f31bb153bmr332142285a.68.1792324591830;
        Sun, 18 Oct 2026 04:56:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2314:10b0:93f:31bb:e3c with SMTP id af79cd13be357-93f31bb153bmr332139985a.68.1792324591331;
        Sun, 18 Oct 2026 04:56:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63cd1esm1370126e87.72.2026.10.18.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:56:29 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:56:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Use DP AltMode defines
Message-ID: <46mtzsydckbt6ca66h3stj7sn37ittzarhc6nqbjp3fitaqx3x@i7b7vbpxsui6>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA0NyBTYWx0ZWRfX9fvZBzrZDUSz
 VMrM5NiGCvnExUZDmXIdLIEPgKzM5DDl1+Kljn7A3dsuA0okROI71Mq7lQYEd7SwIIqXEPdn/I2
 +o/2B6jX7KSLGhDsEu2TOfl2x1h0RMU=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad4b3f0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=imkpALUroobUoGdfvlcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA0NyBTYWx0ZWRfX9omzbRfpghyH
 Ghfv/Fabsaidtk/AVuDzp0XhFaDGqqDF9TOP2MdweXG0MYjAHyw8fydxDwSz4FBb8NZRhx+B+My
 vgwETNr+RB6VbSUgMvpjn3JlbxxIHzZUX8183HUtDUTvwRTps037Qb+aApH+NBnWU9osZSHPeOO
 eH3eFkFG5sHVwhRDdRKGosg2L+qbqjsztQ9gmWUaTcwkUNaLMuMucRKkOivoIH2mBpkYrdshPZd
 KMx2lg7Q4p8uxltX32UoNINic1m76j7ZBO4p97F73KaherahKXrnymPv4w4hhlrGqz0Zg8UrZre
 u2A0txIPE2RalIBJD/WWuODKHNPchShfWrNXIBmMMeH/RLQZ4xoGIbaI0NONFB3zupTF1Z4weHp
 hejIZeG8zLKEpjJFu4Rxecw2adIw6tZGLDPkY72jSZbQT0TLhCM0DAvuzMCsdZSYkj57Rooh9/T
 v7zJSXbzuOjgcJb8bfQ==
X-Proofpoint-ORIG-GUID: PLPJghzIPG-ji8Rumv1eCw6Os4NoMiFT
X-Proofpoint-GUID: PLPJghzIPG-ji8Rumv1eCw6Os4NoMiFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_045633_959981_2E18250F 
X-CRM114-Status: GOOD (  16.08  )
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

On Sat, Oct 17, 2026 at 09:59:33PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++--
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts  | 9 +++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

