Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EB7F44852
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=; b=nEWJsqpM/YXt4CG2Rb+aGwU12I
	Q6FJlGz8T+iiRsrp7S3jjQj+TW2rti0qZSL92lj1lYth0YC/biwIFaRbbyGUeZB7wB49ZnF66Qzjs
	4TiDSTGVob4qxcqSnR1+u9CM2mvONupeTBJqNk7Tx1qsRBcaokO1InUoEKPLDr0U7BMV/lIbOwdwB
	67yGSzfhDczUH9OHtjUGPw/KK/6txC6hDZJdEKYHog0HuLDAyfHinSvTNuMqx2jb78QHXxZ1ojwfz
	xJOtoHhumX6lX3c3o6VB3ZXYG02rrO52UP3PqFHrQ4SqdClPA/N/+e7d5LmceHRuWrn4hwbb3yaI5
	ncQEDvrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBY2-0000000CHhJ-0Q57;
	Fri, 10 Apr 2026 13:05:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBY0-0000000CHfp-2tW3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 13:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=; b=Qare+fOjFs35hD7cdG2WaAlqV+
	fLbKHSvAKZJ5JfkGhyyPMMi4hB8eFNE1HPiooEJdumGE21cT0nzqw3EMT15KVRPe+vpgqcmckqCYy
	pxs3TIlTo+TsSZStNt4STWrGX7N81XNKYiT7W9tLV9p2Fth1kELppIFeOaiQ0XsIkeddD4xi9/IhE
	k2a1rm4kXsgyoCp1pzRntj61QZLN3ZcHPCezispKjWWFIk4SpaqFEihSXRBqPKkNwtzgiUBvKaKO1
	EYZapsskLUfh6uX8LGDKmIHGmuBX1QCVNduuhFMSp2p8CScheq5yrQKXsEtjiezloSbd1413Z7j3S
	XRvnC28g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXx-0000000DXIq-2hDD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:05:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAg5it4147926
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 13:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=; b=XifP1DBRYal/FUlj
	bJFNkprezix621ZqVep0G97j18bnMOTIEO8CZEO137KFVsfmiBWn1ig4e5WWu97H
	AFEwVPMQhByNNQBQ5S3DnOC47fW+fIAFFsd+5BzMamilhnfXFRyjH6ASmx1lXZld
	O6SE0lrLdLDG+i5DbSbpWAV6g3E9ZO5u+MuUvqIDm6sgCSwWCeW9dTfgdb8xHSsc
	7R9Dp5M4YPa6iTc5NGw71xM7KTBILMy0hOJAVCsHCqdxXHO89Sj4as2P7LF/rCQ9
	URo3X40ei0JPw2t9wE5VjBLGRhgJmtBlPyDFENR/5vAhjxerNU0DjrFC4wBU/Xm9
	ujLECA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudghe7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 13:05:15 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-68240056f4cso3646648eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826315; x=1776431115; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=;
        b=KfBp6Abl/wokHHM0tCeESHtdjEKT2Oulry/G0t9STf/wkQQLCdFaOd7/vN2Zax6vpx
         tCu04K20riZaJFku2X0ZSc0WYqnTyx5/GWvYAtQjzy7GcgyCtb5xPKH+o9mZx4DA8vuQ
         mnl8Fy4MgNnmHyfXCF8W0Aup9Bqp2C0iN7FfzeOmoiljBojMfOU5FtUT9B8LZ9rs6RCi
         +Aemky0nUJO1QXQUaXNblxd0x7ZP0lzggpi6/QbPugw/chYDdnCPprkCSZUYmk5X86mP
         8vWOJktThWzU5OuRh6+mhLoskRNYRzIyFU2CIh/hUktVUgwkW4im7yQOkjDbXEvB9CrJ
         rCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826315; x=1776431115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=;
        b=chT3HmRRjUPQBCqmWIummeJmjCsdYJT35UF/i5L3O3yYdHNBA+se1HEhCwxaP+6a71
         tSJ7l6qEUKipMjaqhYo1olnLmIjtGOgD2kyBdpK4k+qECUhXR2DUH0sgFfbEAShyjjr2
         zdDVZErpxF1dfP3VWBG2sSrxlyY2mv+zwgDg4FZxMWKk4OjKCVyVUbdV9aoFDal9Mbz1
         d8qYzt51OQ32cKBeu+cDo/INrzKav74jV7VP5vUSct23VT+4o6XNX705oLyq09WwqhO1
         DNQ/OJvDOfw+JqKhrdPf/qJ84l3w7LwIgdslDTmTGvauRMnWSyj/DeSqdYqq+mS1SvnM
         44KA==
X-Forwarded-Encrypted: i=1; AJvYcCWEfhXGoNmUHbgWY0DZ7G/gAj6U71rd1QY8q2ghaV6P4LkFJmPWWbHQdp4I7kT9loSMIYFVRiePiWAcG9qRGh6d@lists.infradead.org
X-Gm-Message-State: AOJu0YzEpwUj8kOh+h26nwby+2dw8ExAfGsoAsLWUpcB3GS9398RxExA
	4+kn0fcuHmonmGDZoebXJGsfxbrP+rUVjtNXa7U59oUMUJ2pEpcTsUeNsZAPW7bvaJs8PfK3hF7
	bvFqcKTeprD6hKtJL284VgD8DY7pQe+NhpailBqDZJBLDG5vFrv+EKKjh9p0rIF9/s3Y9tumrKA
	WgEQ==
X-Gm-Gg: AeBDievg+THtTxEwrYmklBSVfIvYYrk6OlA249Q4lx1OpQ+EMz1tq+8UAd1kbuJOrix
	koDCkw4XMycp3RKiEmhofbrKxbXfGU1isFWyTlerPT45f4C3t0mx32WbBHROq5Qbj2azXg1Kc/L
	rbCOQ31VCdWqoeGKWCXoL6gLNqgkapE2eA8CaBbqHTngkq/qyJDlKLeME0G/WQE4nSf+NktF+Tb
	P6mEQBKkh9FmEa0UO43jn5+jV4EHBNDXEjEDtbAF6eYo+Q+vBljDgW+p/M5RPqliEkR/nEu4MOH
	84V8WtfyUmCpUVjQ7AHRQYzgxygA/guYumAMf1YQo0SkAFh9ZfFMbKWUeKyswvYi1DBVCJIfBe3
	Q6fQWL/IBKH190zipl7TzBGJVwHl+haOoxYPM4LiFYXy+
X-Received: by 2002:a05:6820:1692:b0:684:b4dc:59f7 with SMTP id 006d021491bc7-68be84d20cemr1449916eaf.52.1775826315108;
        Fri, 10 Apr 2026 06:05:15 -0700 (PDT)
X-Received: by 2002:a05:6820:1692:b0:684:b4dc:59f7 with SMTP id 006d021491bc7-68be84d20cemr1449864eaf.52.1775826314584;
        Fri, 10 Apr 2026 06:05:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:04:59 +0200
Subject: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller
 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GjAMz6tobYIxa/SJLPzRW+5gux+Gh/A3X9VoXHkjEnU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV81Vd+JP/scQiZoHE8MXITVvwB2S+oCSyu5
 bSdXev0yGOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1fAAKCRDBN2bmhouD
 1zcUD/9Yg5PqPB4i0qujDFde34COX9EkMoqe1+Z4Yi+Xoa/AA0fCdkrsfBesbCrqMV98JSevsIG
 YnA6sHvveGld5hbUKAd303/SDLywIlrEOLGlZDMP8vXK21Zb+WjLEoR/UJgjMl4a3vv1MFEdRve
 RVxvFzhbIpiQNiF4Q6vLmATxbrKqalDmxKreE3ZBvVKoNIWlnsPwkp7g1+GgE09Sj230eRg3pAC
 uPIwPD9SKELCOmPVU5DnDMsElI2OnpVkqduvNy6pOfKJtZDoqgAEgSqPGbVFMi90I1LBomNXWsa
 oPmObSxNd48uzwDK1bTxS4EzAC+0FkoehmUtLIsoiXt4RNT2dE8I+I0Mww8Wev5x1QYF5x2AZTd
 U67BBz7tqOwBj129s3hp/RdyzmQXOunfZhRvozGEmwnBiHg+WdCwVDSHE9l/miJ3A03rcbW2uiH
 1krrCtVP4zUpSS+ZkdMGyxKVD/Gz5sGFJAXKxnUMWVl1WN1sIzx11BMI/UaSbRBpddvCPrfdUOa
 Gnq4EAtfCwik2+YUaKNT0IFlJHBNUyr4TcSwtRoOd0CUPMPX/yDHIDPn22ikxRL9QWxo7bI9Tim
 q+H6vpNr7FM0V+f10VkV1ji1RqQfiEU07M/Zs0WoVph6I2tYqIiaLJBF7rC0eQJtuvBf/Bvimpt
 tH+Il+mVaAxb4Mw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: sGgjeVwN5f-G6m5FSF5eNXm96P9CJbc1
X-Proofpoint-GUID: sGgjeVwN5f-G6m5FSF5eNXm96P9CJbc1
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8f58b cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=h1wwraGuyCXQn7UikQ0A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfX+/HGBxawtTH6
 T8Zvg29FYuGWVi6M5utUKxEmo4+MMUIytB7sl099PrJC6gs36BSJdcZffyG27TfQNgWy/kNznH0
 CthSeenNa8D7iZYKUGt1BKMBLIiPlvOp2kU3AfMLOM1VkePEkc6MChNJMN+yulRT9NM8r0woegP
 HSZ1L/JVzjq78TyE6VLj4aTwRG8vQDBt+gxtEK8crSgI139u5n1pLKXz0VXu7XJp3QMB/FHbvHJ
 431BH0CCR9/b8VPeQ4O1hqRc2Z17i9pbcPrFm80aKpDTueCBO7EbQvK8aqyzzP78LWrfGga4zEE
 dnVnE8pLSzmbalFXSqbv5ZwUi52I6V58uT0LoULq0TxbWDR1nN+n0Et52tvUabHxPxGr/gDzfU4
 479yZM3iXIQ1KzG9GL99fV5J+5Mpk7In0ROAPeC2+KafT8wCHqsSw5lhUxbIG/zJAAeymUq0XUo
 e9u+rJShYK/ktV0lsYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_140518_051570_29DB3CE4 
X-CRM114-Status: GOOD (  12.81  )
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

No dedicated maintainers are shown for Realtek SoC pin controllers,
except pinctrl subsystem maintainer, which means reduced review and
impression of abandoned drivers.  Pin controller drivers are essential
part of an SoC, so in case of lack of dedicated entry at least cover it
by the SoC platform maintainers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

This patch should go via Realtek SoC maintainers, not pinctrl.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10d12b51b1f6..374ce55e4fb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3373,6 +3373,7 @@ F:	Documentation/devicetree/bindings/arm/realtek.yaml
 F:	arch/arm/boot/dts/realtek/
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
+F:	drivers/pinctrl/realtek/
 
 ARM/RISC-V/RENESAS ARCHITECTURE
 M:	Geert Uytterhoeven <geert+renesas@glider.be>

-- 
2.51.0


