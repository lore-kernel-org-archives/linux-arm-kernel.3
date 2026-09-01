Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF22C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=; b=jk4uz73Spe+BNvoVvP5YcJWpZv
	p1NlgxjqB1I8J8OMKQhGYAYMYghIVNaARXLGUlDhtGIdYSOVO2/KMxX+HhDAneWvk361FPoNB6uqw
	61+X0A6rWJ9wK/yDPuL+gi1dNSW5l9tHzlssMOFclkOQ9+4RExnVlQhja5eIMC7pnNodPs3r2TqeU
	cO25ckrxeacqKFkfo5k4BAgCHFX9cXkb++Tst2AqC9aSeB4WZfoCGUl1zwZgh5aDxoxNZix9FZohK
	c2b/DMtaMFGyhdUDoXkkKKG6mjS1tocTJOYKZdcmIj9CQP1zomeBmY/QBVsRMwH8gxR9CgL38/h8l
	UEedowyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Qgu-0000000CaFR-3aTQ;
	Tue, 01 Sep 2026 15:46:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Qgr-0000000CaEN-2yO8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:46:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9YcU2748141
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 15:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=; b=dn2uc+TXd6LM8e5N
	jnnwjWOAapq/YOWMDaEoFrFOeBIDw9qcaF15/5VAmvOmGNMj66MbYV0ewcPRKZ79
	sbGACZ3oeO1OFMEmi9OwY9D9VnLExCHrvSRQF60SHV7whqMBhb4Y3eyOMQioBlJU
	vSHKPVsbSHUJ4VBy46m1vYsEY/GbkGTrUE7U3sa2vn9UGV+gDcYeQ7Cb4k/jnxHf
	eyfwOQcrcAfhaR5Lz/d7jIZ5PNctbJ6Y4Wd0AQ3TpgrivnL8mfG2r4ANoGujlQyK
	mD52DMquVUIMMAIxdpBS200NSUd+8D3eu+OmvNfqG5CkgfzxvbfGgs+9hdfEbblP
	lMRRCQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm1fym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 15:46:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso1386894a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277584; cv=none;
        d=google.com; s=arc-20260327;
        b=Vjp7kILKNzx4vy83SrRNhBs1IvWmdxc9GanC9NSPFdu+Lhlq8zjvAIKGUjj2E6KI+U
         lC2s0EcbIhe6Q/LIY19VoiTS5W2wwsxA+Ehdr4IxutYXZLurMoXN9+Y7zV8jAuOzolun
         7LeJL7ijOS2+OPNy6mBEYIWu5ysu0Q22hZgW/eYn2m3DqNdefeXtqn9Q1IiWIi+wT46W
         afoUYRaoo8uosv8P9nn/n2dL3Vssvzq0c/L9iE2/WjD5WPJUg+IZxq6Qcfw33wgInhnu
         mMno5yi9dFZSUHPBENbQC9IbEi9bBR2lz5UcyHLz25HuPMaA70hudeKHHgvtnqZQiKmf
         wVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        fh=BLxK26quTFt77LiQQRgMdZpe2ejc6VZy20m+Kv6PgkA=;
        b=lPr/2vuUJZGVX2ySrgCxG8gT+jU8FSqxbZNs3nXHwslJOBENze0LBzEcK8d+lWxYYf
         eh/I6Hs6zngQdpc+O9pyRU4nRiiJU526wSKLRiFE68hzjUX/7Id0WRY8zmjJhnBMBCuw
         fDBFjapVIK+yf6kpDkYDFpH2RSMFBP/v8Da1WTXpPXxT8bKYFa6/iYMUHDAdQwjOJSFu
         T2+pJbxhAF8FVI+ArpoEbAelTfWIR8o9L0iOOAJHyWpL/GWbhJT9UsoXJylZ1FZRE4rj
         9Y+dq2udZ0W5I22H8Ntaw+zy8MCCik97chqodNR6lPKSomfQQQLjYreRce+yvXO6mNyI
         11XA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277584; x=1788882384; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        b=kkkJThBAMtBKK1wnrhyxHutkjYJ9Yj94irgK8Y7K2G3ikwE3fZ78k87aMNJJgEcy4e
         QIbkyxs//n/VVdbr/2D1AFCKpc45ANuiDkLVI40q0uxcRXbriSD8LZzShoGnyEAMzJBt
         aY3CEmCQj7s0ZwiOPhdOQAj+4fyz2I7sh6ScEOqDtp7bCSf4pyw+FUZoQNWQpzs9ga0l
         RacP1vvSZss/QkmtdyIfILd+A4jjoBsaeRwkPbQCZKsurdt9YfzEhkLdqavgeWrMHZMh
         bF6uJXlJhxhpTqCxHCnBU97PvhBFOQ7y/1Nz2UcsTJnr+LOIXFTVrHjh3hMitgCBEZum
         jsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277584; x=1788882384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        b=FOsJIIvJP3a4rxMXH+rI/4gRt0cW3hk8rbT+Uwj9iQArOMdK7Nw62m+dh9hQOKJw5N
         j6wJtxSg86luIhx2QY01I8fUNat9AZuBM2Bj1i4jVBCsCZr/eFXX/URrlpR88xHlWJge
         0SwBhUgtBAZPj/6r4bEwBiSP+KRSe9zNJTLoBVNsXetG3ovBCochnhenAe4os3uDz3uB
         OKEmsQZTI+qkKBAJcWxgZQAzJmVDjNTE9rFUX7fYahRp2NiAS6fqHqoqjuiQR40HRQPO
         6U4EqpkoKnL90OziB97teCrFh9P7reItOH+dNOHrkBj2+xWr4o+O15IrdtBWj+umKigA
         UWMg==
X-Forwarded-Encrypted: i=1; AKwUvBzD1MUTYEIi0m0v2b6oRMzhri90G3KlZromKyqy6yDUcj7i9iyHOthxC6LXnANB0vaNRSlkPhGS7kzwxM+5H4mx@lists.infradead.org
X-Gm-Message-State: AFuF++lNDQgNL4d8NXueke+fYaCHKNo7m2wBuvQC8WJvDSp9jM0tAl5n
	JL8L/1a5JQ8NRJhUgLSNP8siGy1sBw+LgKNx/VzJ0hALGcvEoAecWNFsgwmb0Hc3bSyQhLUG3Xr
	JZ1KoTKQT9abgB49nCx2KSAFTJajiXe2szXgUPp8ZOeRQ7EcytNVn+xl8PgauL2ZuE49uqjJe30
	V9bWSqiiso8OFLr4cWD3pdPLhXUv44ZismcjJkUFgxQatvLGjrB3hQ
X-Gm-Gg: AYBFou0r5rSDOT2zwSDym1PP09CaHynVWspPWr8IFJqbsi2cRvNzUIuu5LbU1KYKA48
	FfHdut2x/0uDPwB+r1bX3XtP2IFtrndnMSpWdVW5K4M8I9UkzFlpsQ/VsxNErKrPPeFfxpzjgkb
	MZzBvLNQmq5EvnMGsh2wafvOw/JlKNYNk1Y8DFviTWkV8RH21JBuE2O0sNWw==
X-Received: by 2002:a17:90b:164c:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-3990f79ddfcmr3891980a91.5.1788277583829;
        Tue, 01 Sep 2026 08:46:23 -0700 (PDT)
X-Received: by 2002:a17:90b:164c:b0:398:baa7:4c2f with SMTP id
 98e67ed59e1d1-3990f79ddfcmr3891921a91.5.1788277583296; Tue, 01 Sep 2026
 08:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:11 +0200
X-Gm-Features: AcwNN1UOgtX_S0RX4JszYubxSoHCtUSFoVM1QL-GMxkUwhBphaMhOq7ZdQsciOw
Message-ID: <CAPx+jO8u_w417z-z_2fkQcody_sYbijHWTowZ-RsKH4Yw3xW5g@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 24rrThtPt3kfIJLnj7etrhzJpWyLq0CF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfXydsf56sflYAY
 7Hk2qzUZmTDA8iafJ/UEAptHwGGR9f/X/ffHdhQVqxwf0A7d9/yEsm63+zOVU5JDo99wciBKBbL
 niTSprL1DISdzAGYfRT8RIBLS+zUvDo=
X-Proofpoint-GUID: 24rrThtPt3kfIJLnj7etrhzJpWyLq0CF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX1wtzAoS7gfO1
 P8yxLrXcJ2vQjhNBcrioRZjyH+F5LeSoTX2wjuCZhl1ibpNrUKBRR1J/gMf0ygk1fWSVPJSGl4h
 OWo6IHNS6o5EZg0cj6NrgZzQGxfza4NVf89OKQhvSSAg3e63cGqIv4dj4S+dQI8St7+s7kS6sbO
 DzAryeKo7ytJrm25GAOKdUT4CFP9F+g2nsKoPg7WU+99UYS1yGMd3smn6FQ6Mm0sP+Ll9YnPJCw
 52FcIICFHpU5+5aMiHPR6mu547H4ed/Ff6C0ZRR0T6Cv9Yb0VagIhPzjx2fW30/eW03iXokNQ0U
 oiBMZEMiL4M25QcqwMJubCaPmKesX9P0iLAYGipYsxrZOTbCfECDK6Rt3uuH7J5avSRXM65oSZk
 M953fKil/amwsSY2HXOcLrPvAeLgag==
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96f350 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_uS-18hJZPm8K8KRSTQA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609010139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_084625_861007_74E9F20D 
X-CRM114-Status: GOOD (  20.78  )
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

On Thu, Aug 27, 2026 at 7:51=E2=80=AFPM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:
>
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
>
>   - Global Clock Controller (GCC) and RPMh clock controller
>   - RPMh power domains
>   - Interconnect (NoC) provider
>   - TLMM pin controller
>   - PDC interrupt controller and SCM firmware interface
>   - Devicetree for the SoC and the Kuno IDP board
>
> The soc: qcom: geni-se patch allows the GENI serial engine driver to be
> selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
> depends on.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v5:
> - Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
>   (added in v4), so like the other Qualcomm GCC drivers it must select
>   QCOM_GDSC; otherwise, in a configuration where nothing else enables it
>   (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() retur=
ns
>   -ENOSYS and the clock controller fails to probe.
> - Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-=
dd34f235fc1a@oss.qualcomm.com/
>

Patch 2 and 3 applied for next, thanks!

[...]

Kind regards
Uffe

