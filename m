Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E969C55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=; b=a7lx5UqDBySfFequTUPI+L6x/f
	d9O5ECiq1qlaHtv9u+ONgjUzQ8JDsoZ4GW3dt7Eu/vAg+3but4bMxz5fG6NP5vfl35YWbiwil/xUS
	nYWtd4Y9r80YkVx53b1G9YCKpcjgTy7HyWHloYFX1UHsTKhIfSjP0JXE0zvksj6df/stdsifAYLCQ
	/FLYH46qfUc9qRhDfh64x+gmXtdbuuVx2fqpI34eawO6E9nP4efrtAUxq7aWrw23X3f11+CeRdGwJ
	BF7/MMyoBzPMB1SBc57pGXpQxMngEeinRGp2dy45vQbFMaEJacmPzXV6UIuz1rXqLsB5tjh6VmbP+
	WkkFEpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGHO-0000000263Q-2mSx;
	Tue, 04 Aug 2026 14:38:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGHM-0000000262p-3i7w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:38:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXLVu185362
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 14:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=; b=of8sOQp9xUSfTu71
	IHMwC4jMPpavp12E+ekTQze2YGL05ivig4ZfN52E1ZLalg5gz3McVISQCUYoa5R8
	122GhAoYJvhNsWfxgBqKfKB46LEmC9gqrflOwl4QSG4j+bVHBIemZ+AquCwJ9oj3
	HWJjwrlVjKveGsR3Y0mTvtHHYqY0VuSaZKoKei075ReWkK0deKUQzR3cg2+qbrDg
	L2AHymVMoS43fM4uDIsOvMvq7BZ73Y37kzegg1uvEWooxdryIlgcn7WMwKCVyhPm
	E8EY8dw0UKfYsQW9dMassyHPtfGMAaArB/IE3pWDce7FmooGveCBPXBqS1jQ39N6
	QulxNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p4v2v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 14:38:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so478089085a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 07:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785854282; cv=none;
        d=google.com; s=arc-20260327;
        b=hDFeA2a/N2/OIs+5VhQca6NX0fUelVEPmfv1KgiTNz4hidDp7nX4SwA9qvT2sRLCPr
         gEcQ0w9r8Rv/En+eWQyKOZ8xezSnAH+UdEPKa0Vg5xBw+Hef5gXdwzqcXhW1mkIrHR8a
         6AT5VztlgCXKHgUzkFAY0WXA5Yv7G6kLHhtQoILMtneM1aKnNcnzNBYe81NnFl3PIEa5
         s3KKfwWI++kZX5cTFP1k0izOi8/YMSP1KByOKToiF14PVkD5vX1XavtNMtpVnvBEqPnr
         ySyoNGxSKM8RYJn9XEuqHAJeskeoW2YAAzoqUiO8NMMSqIhoxb/ZNHz7Oz++23unwX0C
         luew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=;
        fh=6OUWQUcFpWR9iP/tncWejZDpqypfs6fRq6R1VPXlvhg=;
        b=m19R+6F7q20nasbikD35cfX+l0TO/aJlwDqZ1QdmAwo1W5Nr30ssgWLkz8SMyP0BhR
         abpkyT2rO+ahE812GaYKLipdSmHQYqE9zyWRnEmxOOff6bfMnAtAsXwQmQBOki5Cw5Mo
         /ZrpcCmoKJHRzqsrXJ5gRbR/pqxKQ74D6paU4ZOLD84Ago1Hwd3OARdmIjJJfrr+vgRw
         SXd8RFAq2u8U/1VZbUeSe3Jrs6lZonimVeW1EiaJ4QoikvwioKVFtPpAb6+pl0crzDac
         iji20YbBB0XJMGFmXsBG7qZ1AEseXgCwlza0repo1RslTvfkAkPuyHdQZcezGAE8PkY9
         9GHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785854282; x=1786459082; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=;
        b=cGEJlWngbZncYSKF3kc20BZ6vloDHtOw640mVE5g3ygopU6AdFeiYyAYL+Bius9yOR
         hYb6ltYWYYTTW9Lqv+RokmCfS5VUDacjEWQIIPS4uW86XV3oW7HIBM69ewb4cdpNNyXI
         PRfbLPvkXBK31t3UgMdhzz2DEimc7SLXEoBee2Qa9SqZTfvi7IFg5ny0I+6CGERVAg7p
         SH0hwB4lHykInKrfLq3JTBnAG3RxZ7GEPzMw+22U333nYPeeakTEe8Cu4awWj+5uMmE+
         op1OYoauSNhyCrzD440BtnYO1Hd+dBj8SFQW9eDijkDNdyHBd7L5oe/HMnuv57k47X9n
         PElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785854282; x=1786459082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBSOug13prxCCT+BAqmbK4GJruJOjABAt4v/5onpB8g=;
        b=WRSbVK2qZ7FjteBnr1mNUWxObiKZwNCMmYB5Y52ObP+AWmSlZ/D/4/KosYryXh2d61
         Q8vtHqWPcPsxVwuATRGbkZHCfRcf/6pYF7IZCrZdwD0Cu2zSNDN1z2ziYXtXa9yLIyJj
         MJpPu8FUPO80P2OXgZL457TFLchqUVQEVthcpRfQnoLWWZBe3DgIaupi3JtGokGKPnr7
         OmQ9zVGAfGNKDqkU0tI11sfRIwwMWdKQpjwIcrEYliyt78yHDuRcyJlIbMfKQDCKBOA6
         +4oKIyYAnIDpu2BxM+iJ4mEJTKuYC74Kr7c3JnCOXHGMoDx0O8MIPWstA3lgJEYlt47d
         g+wQ==
X-Forwarded-Encrypted: i=1; AHgh+RrulNG+bf++vS0BsOQgTbrqreOnJf/jZk/KPzgPNgY4oKRg3p5LE6h83qso+nz5y+qL97b3stcjqE0dwESlregc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf/gR2FMxS+FoSPcCTNi2Odg9oE5IDHFZbtPToC2U/tA2mKoww
	JUiAC6h9TYKZPWsNWoUTGh7N8Aonna8U5Y3TLyHtDMcQMtz/d6joO80URqz940vbrvtSiC9UVx1
	dFwvuwUEzeETj63QjjP8zKZ4IecE7sb7Cq0PGi5PWP3ghI8lzsEo4rha1wCzxWp/Ab3Aj37g2Ka
	YrpnmfZNd3LSUw51d7NbIaAjVAgfus5qU0hHTqOp6Wt/U1I/CZwdav
X-Gm-Gg: AR+sD13ADXOPR78qHZNVNQ2rvBktIXSzXUsaRuq/bc06+vEGHor8NUXdQFIvN/wRXu6
	l7hfkFFGukiK4FrPYTdxTP7ACxJTpKF/ul5dTXBn/zMEbNkBQW4K78UlYwOrSUBkKchBzRleujb
	p7X2TjDuKuCEhC/JNLekBBMrn23YtpUZKupvWGAYoxNh22UulwxormAxbjbw==
X-Received: by 2002:a05:620a:a407:10b0:92e:bc28:5479 with SMTP id af79cd13be357-934a07523e6mr2091178385a.2.1785854282359;
        Tue, 04 Aug 2026 07:38:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a407:10b0:92e:bc28:5479 with SMTP id
 af79cd13be357-934a07523e6mr2091173285a.2.1785854281821; Tue, 04 Aug 2026
 07:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
In-Reply-To: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 16:37:51 +0200
X-Gm-Features: AUfX_mxidf6ep2hrmZtMSZcppo4HDdyELeecQKKRS0CT2NESLqRaSdKaXo6bY6M
Message-ID: <CAPx+jO9RBvDJHSoCT3QVUCfGK3bLduhV1W7T7VuHipOvas1v+g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Power: Add power domain for A9
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulfh@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a71f94c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=BY5PBP3jAAAA:8
 a=stQ3y3mWCCOjWvy4rzMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=gQW0MTutLl7eKD3OLfcZ:22
X-Proofpoint-ORIG-GUID: Y1oSau6krTH1lWMrC7c3qrkz1e-XMiYg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfX+aVb8ARvsH8Q
 ROLtmylldgI/lsY5YePqRbY2/2n00HKskjm6c6m9Z+hEh5a1J4BgK+hOM6ADryYdZdCBR9EEjMz
 5yO63oMJ3QpOhLZ9ltpmamXV60Z2iTY=
X-Proofpoint-GUID: Y1oSau6krTH1lWMrC7c3qrkz1e-XMiYg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfX88exBtfDuwuk
 78HlHMeT0h9QDy5xqEFkn5YXcl8US6ofWt9U1KX9y+/yOPKLDWDUVE4jgvZyPDhV++OShitq8sw
 6O63hJo6kBZ+0oRDpgZrs9TZX2RRM8Cngn+qGXKdKGqMlVG4q3Pob+TXL6lMQlhlo9DcAKYBU2d
 ebiUg+uiTU4ru2RiPRKQR8Suwhz4tfzO9C6LafHQUk7hYBAEHSSsR4efI2vo7N1sozlgu/qVrKg
 /5Hs6CCNNAZkZcS9X1yRIDXeHleNv+h+YLMTzVqaupZC7e16/fU+f38t4PItCjR+YHDkbeZKh9l
 2eeCVegyGUzHil8rAD79g+hZsDuS90x2GpjZA2Uem39385uAsS7zqzChp8hadWnbVhvJ/XjaUuh
 w+/WOvwTA9OwndPsrhQrkquJ3CO1mday81VILpJLGzOqMLDNeskszvLOE5DpfcET/ngbXz8IPhV
 xDP3b32unfg/di12U6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_073804_941855_B9AEC397 
X-CRM114-Status: GOOD (  16.45  )
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

On Wed, Jul 22, 2026 at 10:39=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> Add power controller driver support for Amlogic A9 SoC.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Xianwei Zhao (3):
>       dt-bindings: power: Add Amlogic A9 power domains
>       pmdomain: amlogic: Add support for A9 power domains controller
>       arm64: dts: amlogic: a9: Add power domain controller node
>
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  1 +
>  arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        | 10 ++++
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 69 ++++++++++++++++=
++++++
>  include/dt-bindings/power/amlogic,a9-pwrc.h        | 61 ++++++++++++++++=
+++
>  4 files changed, 141 insertions(+)
> ---
> base-commit: 544455a3a844edd6107b15cd0ab0b657399f2d49
> change-id: 20260722-a9-pm-3efb3f2a4d72
>
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
>
>

Patch1 and patch2 applied for next, thanks!

Please note, patch1 (dt patch) is also available in the immutable dt
branch, for SoC maintainers to pull in if needed for patch3.

Kind regards
Uffe

