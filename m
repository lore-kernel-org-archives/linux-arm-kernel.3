Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAF6C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyW5Ix8KToU6pCiBFnCkXGyPrVI7Tj3cGyVGu4U9jKg=; b=cA9WZcfrdMoykEeel5yDIfBgvt
	GlWmYLDNZ2vJWEOTgZVZKNAsU1BGWNyxZ0GBlDJZE3JI+iaenyqwN5ItsIXgHZZCpUuzHneDAmlIK
	jF8EKQ3xurJQ+oA/9zLkc8TN/l1DU8mJd5NHTz+eNjPdSuZ7FCLkcpAY2PMib6t9qieCQpQD7wG7I
	VHOpNQAfHO3hzdSDLVmpXUllENfxoWm8iYL3i/X/rKvTORTv+GMrNL4+pGv0L2W8x7XbOusWb7xUg
	ve8sDsyC6T5IMIYbaSUMrE6+2nVy2ieWYeb4g1NJG2aAVINtYZE4Ito1q/uflbgU+XbFoHuT1Puaf
	cgpxZmzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4u1x-0000000Ftax-2rRO;
	Fri, 11 Sep 2026 05:42:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4u1u-0000000Fta3-2vqR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:42:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vS4f3665094
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WyW5Ix8KToU6pCiBFnCkXGyP
	rVI7Tj3cGyVGu4U9jKg=; b=DVzfSWA/MwaqFRStfjxh9NUgP3Xj5lPcKOzWHJft
	je/MZknn4OXevJUHGt65hS01LjEqJZeXEguXm3q4w2QXF/v+k5GH2wN3+QCoXER/
	sg6VXwP3d7mOZdT/5L04SQLhJx0O/QLwAppqVHeVcyaYdfr8rfp+fDhgFfbMuSCZ
	wgaYs2udIiin89msH8L9WaNtlT1rTMv1tfC7gDjQGjAoQcfJkPi/9FL5l6PKosld
	M5W0fXagukeZXQWuSq2wpKmqXIrQth4PlSM57x5MBQXl1ZTix6wM8DNPd5taCLyp
	7yUOXjFpfjA9Ti8JMt3tzZsHyCal2Xwl/TwI+C10d7QSaQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q11vsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:42:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so934720a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 22:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789105348; x=1789710148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WyW5Ix8KToU6pCiBFnCkXGyPrVI7Tj3cGyVGu4U9jKg=;
        b=kunZPwLhn0QvL/x1FUAgEQc3sIFTFHYxd1rwXCjN+fHKn5/DqPTytbMs4bp5gZikXw
         5msaH2Oqvj7DtnO0B96cBvSxJDSTDEwnW1spmklp5Nc4pFnCAYODpRr1OtPKXDtPkU2Y
         22rmvwJ4BS7NMtkpLuhI1UtFL9MGNMBiEN1QJyEVIx4tpAtW3MatoQJ4XcwzFf8OhLMK
         IlRiLZQ4TcHJzh/hFfA+zzCHRJv7Llh+D31jD2gXVmsrWQmzSEJbhyebHK3ewk1+ifgx
         s3uYuIDQqg7KoE4xhZN+zOOQ8SHwbe0PIm8QGTxnmnbM2KpEA1FuRyj342YMZZBUoMeT
         9Cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789105348; x=1789710148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyW5Ix8KToU6pCiBFnCkXGyPrVI7Tj3cGyVGu4U9jKg=;
        b=UquWZe///N06Q2Wia/IRXDpjwrjJvK8MtYv4YpYzz6h6X3PHg2abr5jDvewP1gh7D/
         PVPG+8VKd/GV5NKkzATgXZBOpky87j7fYVl+DVbkqJaTDIo/qVcSAiziNUMWHk6WKEH+
         QH1/OWa5FEAl+ESU7R7SiPHR/MG4gbDiDwfyGWhdZbxl4jezxDvZX5mnVm+27JqPz0Zl
         VkmlJrx+dVU5/CgNK+FQl/eHohM+YQHq7Ewmv1KvrL8eMPV0y+SSPaiGNHTnzSDQvjDc
         2YVf1yup99Vo7YTWxKaJEY9Da8iA3T/RdCfuLm/TCGspYaSNQBZJz7r/qp035kXivx2w
         /bqA==
X-Forwarded-Encrypted: i=1; AKwUvBwN/HKcERoCwp9bQj6+/JL5wpyV+PxTD0eshq3RmnEg+0FWVoyR9BKPvCjcgbSR7ldB93RTzdg53/zqiNJAqsvy@lists.infradead.org
X-Gm-Message-State: AFuF++nLKaMiNQE6invmLYnICaCt8jG1R20lvHf0Ocvu+MpVCNVqVZrT
	v/PMeD3BNoL9VvaSDdkUOTJPff1K0WRByOG9jpSMPaRriaJJQKtSfz4+r22RIZYfFtoJCTEX7XE
	rPHG4jDSsXIRMxqSLRhRjHUZ99wLoiIycyaA1YiNcUblisj9mBJlBsNRfMqxAmAX6hk6utyOAA6
	5zHA==
X-Gm-Gg: AYBFou1fxxgYLIa5ClTHV6AOPVuEkWqY84lOxTNfUwAtfqyAsH4gkpXGYLFZUf273xu
	EEymCZ2QfoVzHyn6OovhLbZEj1uyqbD/uLaTAJAI3QnCrfPtnMH1OABqTCXrRL6QBA5yRMlzniJ
	GxnfwSMgiaYUR9cujw+WyuBFTFuMdK0z17gG1hHMQZTTAJYpIxDRkJbEjJc5xJOnfrjxYiJGtI9
	pRCpf9a6s/XPofCCCpw29A/15So7yiHpaaXO/dKRpyyG1ZTjGlmDdUAqrsqpFBEsbDiu2HrAx3b
	shbTLZKMp/bbGpQgL2UeBNzpbbxgkcLjPNlMiSrr6cEc3Z0eppJmmKLKeS0yTgpIC7BmFGc0A1o
	pkc4XaE8DRK011j/dM1TyK3zEdI9R6t0Z4f6O
X-Received: by 2002:a17:90b:574c:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39d9bd99cb7mr4584969a91.7.1789105348399;
        Thu, 10 Sep 2026 22:42:28 -0700 (PDT)
X-Received: by 2002:a17:90b:574c:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39d9bd99cb7mr4584897a91.7.1789105347944;
        Thu, 10 Sep 2026 22:42:27 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm2836115eec.30.2026.09.10.22.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:42:27 -0700 (PDT)
Date: Fri, 11 Sep 2026 11:12:20 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 required vcc-supply property
Message-ID: <aqOUvKiybGs/YUxH@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
 <CAPY8ntCF6e3FZPx0BwZKJimACwdUKwNSP+SPjNUE+1DgQC1=Qg@mail.gmail.com>
 <20260907-atlantic-modular-8f3c1582635e@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-atlantic-modular-8f3c1582635e@spud>
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa394c5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DV-kZd77nCGiJ58iTUQA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA3NyBTYWx0ZWRfX4Od7WPCcier1
 aAoIHGGgzKRjlYSBNGMhry2Z4dkEAvV6jhTWVFLHSVDLQUBKBvHa1eMisOwKWM5OAX1WQ1lGInB
 l0cjPMdLO/4BlHQq7xPjarB+xHARkTPAgb0xJ7Tz8TvM7zmVnechdE7MSAYzYgWQ0q5cpOHoiF0
 qSKZnVdHM50NeZcFe/Kt9tM+r/wO5CXgBp+jMxk/fq/mAGGPfCm+Rda2vhora5PDhgDKMQAWBiy
 rgFx3oGEyEZHH/KfzAu3vAOjBPMSDNhA7NdbCKjsXyyu7rR/ITZNnoUr4FEFZPvD5yXZCE7tky3
 1BI1kK8ji8hDiW0NWYt+fHdkclOxcCzU6UEwI+zx1NxiHtLViit9+m1i5OKQeCGRU1AwN2Hm6o0
 X3ATpqxUoObCos9/iZ6y2VSm6Yi/0M866/mAO4YjUd1mVPt1qLHvRXHbkOsZB2oGLIXJ26amsH2
 XhMQPQzKD7QcVngd0nA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA3NyBTYWx0ZWRfX1t7AvU4SD7wv
 47IAnvg2lRSLc5oEMyCvoNDD20ciBaiNPxWc701fg78sGvh2RRnwyqTh6hDXxBlnTYLx5j79pff
 O8H2WXrJP5ylRbx3ZtkoftehvAZudHw=
X-Proofpoint-GUID: OkQ1RCDLuK17p3OJ6lhN95jcRvMTu_73
X-Proofpoint-ORIG-GUID: OkQ1RCDLuK17p3OJ6lhN95jcRvMTu_73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_224230_854484_17CBB61D 
X-CRM114-Status: GOOD (  29.73  )
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

On Mon, Sep 07, 2026 at 06:10:36PM +0100, Conor Dooley wrote:
> On Mon, Sep 07, 2026 at 02:24:09PM +0100, Dave Stevenson wrote:
> > Hi Shashank
> > 
> > (Apologies for the earlier HTML version of this - I thought I had my
> > mail client under control)
> > 
> > On Mon, 7 Sept 2026 at 06:48, Shashank Maurya
> > <shashank.maurya@oss.qualcomm.com> wrote:
> > >
> > > Add a vcc-supply property to the Raspberry Pi 7" touchscreen panel V2
> > > regulator binding and mark it as required. The panel controller MCU
> > > needs an external power rail to be supplied before any I2C communication
> > > can take place.
> > >
> > > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > > ---
> > >  .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml  | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> > > index 37b9ed371b67..a6195e53be16 100644
> > > --- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> > > +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> > > @@ -35,6 +35,9 @@ properties:
> > >      const: 3
> > >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> > >
> > > +  vcc-supply:
> > > +    description: Regulator supplying power to the panel controller.
> > > +
> > >  additionalProperties: false
> > >
> > >  required:
> > > @@ -43,6 +46,7 @@ required:
> > >    - gpio-controller
> > >    - "#gpio-cells"
> > >    - "#pwm-cells"
> > > +  - vcc-supply
> > 
> > Adding a new property as "required" breaks all existing users. Adding
> > it as optional would be reasonable.
> 
> It can be made required here, but never in the driver. If it's actually
> required that something turn this on before the device can be used,
> making it required is probably correct.

Thanks Dave for clarification. I also see one existing consumer of this 
regulator driver: arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi

So, adding required in bindings will fail for this user. 
Apologies, I didn't notice this earlier.

> 
> > 
> >   Dave
> > 
> > >
> > >  examples:
> > >    - |
> > > @@ -55,6 +59,7 @@ examples:
> > >          gpio-controller;
> > >          #gpio-cells = <2>;
> > >          #pwm-cells = <3>;
> > > +        vcc-supply = <&vcc_reg>;
> > >        };
> > >      };
> > >
> > >
> > > --
> > > 2.34.1
> > >
> > >



