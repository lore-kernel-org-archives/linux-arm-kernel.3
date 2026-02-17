Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE011E909A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhKQK2oMgMyTX3pGdWQYzychtBQt+y8zRLcS1x1LvAE=; b=rjpoDhx1i7uFRx
	hQZiwCCbebR00ytnq5PuuQd8vTfEwYvZT7GTFKol5cgR6NtUH4OKPqYd/GqGIPwP8nD08P0vDgrRZ
	zHYjPX3ohGD9kYQDH3uTJLy2auytAwcwBlqb95xEBKHDyFvmdJEIIVbdM/S38jFdN6vkhq5VsiFLF
	KsHmzjvhf+kCuoV25QZwzZ7zPrWajtDR+NqQeIz3wzxe04mQGwnZetsDhr4VZHAOIMg1gjsA2DIle
	FM5dp1GqBzASq3ZZ19NZgVuFzfEd3zzPiQjAnj6jbnqTP2ZncZCbjMJ96NiUkQ1040O78uAMYjY/6
	v9M0izTiYOpywCakMRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLIT-00000008LK2-3su8;
	Tue, 17 Feb 2026 13:39:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLIG-00000008LC2-0Fqz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:39:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBMguu1613313
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 13:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BhKQK2oMgMy
	TX3pGdWQYzychtBQt+y8zRLcS1x1LvAE=; b=a5i06TvR4wBVOb8P7ka3jPtnGgW
	hJlHRTlxIH1q5PaxBi2xKwPtN/w8OP3jCjRWv8Y3qOrFP3fuCY2Qegtjm5JpYnTE
	hc3eVw1C4N2oG+Wkw4569L+mnjJldSEAIpEWlMdrdsthvoXEBZphIblpRP2HX4ih
	mswr9i5NEZHUrjGK4Ljjxz4FqqkmE1tr14p+029VFeeEPVNNhae4zT5kj6uWAvYW
	xkmJG1lLbzJou8QChpAinH/Mwha4F3BDjWhe2kt0E7pryNgsIOLbwNFxOp9E3Gxr
	qgDCCqa27HQo4PFB+p4C/QhqXq4Ern5NESEpYJQvesmoc1OhdBuqlLV6ncA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662tk4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 13:39:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82442b44d94so2107902b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 05:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771335550; x=1771940350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhKQK2oMgMyTX3pGdWQYzychtBQt+y8zRLcS1x1LvAE=;
        b=GJTIbt1PdhAwZjIr3r1IB+8/piiaHbeOtvub9UVg/rheU5gmjL0Vokc0HFzdIbFDQ6
         gbOU/aF5KryKwjQ01Oe+MmA2T6gBrlbwlrX/YSLxqazipgETeq78WPnw4x0bPMaeTa5D
         uQH4Ha5RQM5D/XX3Pcdw3aqBTnwztl8vzJ/f4Jre1uL7et2zaQainqqoYMtg7+AeFgKa
         ojFsTPf8W/yaLjWnL3alyDSSTc42MlMRVGsTtGFtPv/A/NvICICttL6xUU+Brm8sekuf
         vyGFsyHb+4PgHjIFD5nOAdyQA17mxEIEGXH+EfbUYckeoE2o7T11weft676zjHOUVbfP
         sX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771335550; x=1771940350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BhKQK2oMgMyTX3pGdWQYzychtBQt+y8zRLcS1x1LvAE=;
        b=Z1D1gqNX7o9783fYXbioQgwR4NzKFKOS6ZOTMqqSSE7NUui15GHvI1W/1hD/S5Wgp6
         ZzIypaAPGRTCazkjO1YRhmz0kVmLUpeIWQ+RSyy3izT4yYjjnaY97vFvhQ58XomgK7V7
         ODqIhF/IxQOM4FwyCK4zqVHWVq/C6nmfzEdkj51iKiHyH8D8WXc+DODB9JAGf3G00Ilx
         lU6rtU2Uz66b9AJVooKK+zIWACepgpC2i4sIOOLbV6MLIzSF6bolSh8vtxo4Yc+uaDM9
         M5ezGwfi/6Kvj8fPcZvimX6w8DWa+q8oyjP9Qt3DSCOq/K3hQmhan1S4KYPmjF4Msika
         W6+g==
X-Gm-Message-State: AOJu0Yy/Gdp7gtBltOlcx5yyTGxNa5PoWJUp3E0lNcMVxWlhzwy+iCGF
	eJFNsMEiFnP69kmMKxjBowdQzqm4dhAl+ORg0IcmROW3KUClquvXpDuwJ/TezqaMBTsf7ZjwolF
	TFsOpiH9eA7SlffcFDmCadchBjn2wOAGnb6yGrjLgQc259nlqFgy9NESsnpITFdfGAVJWnr9+UL
	lkIHmev665Sw==
X-Gm-Gg: AZuq6aL3fqGOHDbaMCbQep9iAzQkbWqscfzMTIUkG1fS9aeOOGkeBryYX4xF/G1yNGp
	gr+/YD0FTiVNelSL4AEkF8byVt6yEtsG5jeDgEL9uG2FPCrCJjL39vUKMA4nhZ62nLqjId+4CVo
	QGrcjONAR15xjt+YSEII945eDz1GO3qYZelvfNNduA01kcVg22ax2/nKhOdpIFGLsOV8vot1BW3
	T8diCH7fc4yzwxSsf3XILDTPFV6cSbKYGIDyeBpzveMxmY5rR4A/ctO8/AsRwh6NfW26aGwq8KX
	kZDzMoDFVDNAe3PvPHQNYlV47Kb5U2ynaoiMF04NjVNbQKE1HWhYtad80fA30LSb0BTn8EGVx7G
	fGg8omBXocCTWIEx6SIhd+GwbbIjXBdRhmeRstT0AheWlymqczy/C
X-Received: by 2002:a05:6a00:e84:b0:81f:3f6e:166 with SMTP id d2e1a72fcca58-824c95e4266mr12349196b3a.46.1771335549906;
        Tue, 17 Feb 2026 05:39:09 -0800 (PST)
X-Received: by 2002:a05:6a00:e84:b0:81f:3f6e:166 with SMTP id d2e1a72fcca58-824c95e4266mr12349176b3a.46.1771335549446;
        Tue, 17 Feb 2026 05:39:09 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b935c6sm14633207b3a.47.2026.02.17.05.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:39:09 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: insn: drop NOP from steppable hint list
Date: Tue, 17 Feb 2026 19:08:55 +0530
Message-Id: <20260217133855.3142192-3-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExMCBTYWx0ZWRfX8dt40TafTODT
 nh21I9/ECKL9GAA3DEGs6fEiy/gTbBI3Io6hkIgILI/x/f7ruY8BwPP3HwO84aA+hntOKz7oOmL
 AJypak1XY6RLdKD/TNJUgNivoi9DMcW3UHQzRmw+sT3olGZ+rGuzMfSVgAeHGO75cxeykSdaSPR
 qrLU/7dCHT4gL8EsqVSP2BqLYgpCkJ7HzWDP/PSmQnbpsPVxFmzng3NKhRkgbXfx5C7IugY12nq
 +QsK0Q1luMWZsSR1cOgF1/ehV++24HLgNkekEHH/9PEXFf1VlNIq6JvwwGaQCi4E3jSR4TYO7YO
 mzwo3bpZzEkj/Cb1wCYLPh/aHJZYUj8qtQ6wd6PlJpF6siY0yohtbx44LAIKbxBb4uupinrlR83
 fD2XULA0DnISBPQd76GbmPFcIGEdx2hq3zjBJJlRgYHKNU1CQUOpp/K+trbhYf64RTUHP+5j5aD
 w2StOEqkFm68O85y/nA==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69946f7f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=OUhaZ1_5ODAiWoFFvy8A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: DL0NcxfSWavBggm1KFFTei6b_zsrwl0Q
X-Proofpoint-ORIG-GUID: DL0NcxfSWavBggm1KFFTei6b_zsrwl0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_053924_357516_24B6C31F 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, dev.jain@arm.com, linux-kernel@vger.kernel.org, yang@os.amperecomputing.com, linux-arm-msm@vger.kernel.org, will@kernel.org, mhiramat@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

NOP is already handled via instruction emulation and does not require
single-stepping. Drop it from aarch64_insn_is_steppable_hint().

Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
---
 arch/arm64/include/asm/insn.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index e1d30ba99d01..9429f76906e0 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -456,7 +456,6 @@ static __always_inline bool aarch64_insn_is_steppable_hint(u32 insn)
 	case AARCH64_INSN_HINT_BTIC:
 	case AARCH64_INSN_HINT_BTIJ:
 	case AARCH64_INSN_HINT_BTIJC:
-	case AARCH64_INSN_HINT_NOP:
 		return true;
 	default:
 		return false;
-- 
2.34.1


