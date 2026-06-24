Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC9ACDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TmWx5mlplJVO/aPdm2p03EimgzhiIPG+EYrUm6eliLc=; b=jgS2vQP6aepvW5
	upxpwedQK0JJXm/PSLdUImzNsFWm+oCIZFdBv656QzzuBI/fCGqkmqb7JZXqiJtgT18eQFZ5ASFIe
	xUupXzmNCv8IRBrg4TUQ3RvmMjZYDR8IDOaAvkK7hrJG/3a4f16/6YrdngLlmUzEaQEOZZLFf3KOd
	kTF8uvSTGwj6zRqUPbBG9Xf00f6dBaWYzYsUKhTLjwNLE8C5OfupBR1MJyPEu13CW3LZmYzbcLgHn
	FDTX22Jq8JAplF5NAOqoktr3TRPtCiaOy/bkxqICBgqMQ3n6euDwkTj2ZWw8NlFET2Pj8hJfmorHN
	geaODLFo9dQtRJc5osXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKEx-00000007XUA-2SDZ;
	Wed, 24 Jun 2026 09:49:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKEv-00000007XTf-0K1r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:49:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O7FhPU2439230
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 09:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TmWx5mlplJVO/aPdm2p03E
	imgzhiIPG+EYrUm6eliLc=; b=lsdg1egxi3g13WvSRiEs1oA4x7S3KeHlsiu3U2
	+6d/IuYJpg5tYoXOgDJ/ALaR6P/UkmUSQQZLaNBbnesLjsTdJ2sRyJwfP7sq4ICg
	KNtnC3g2YXYnYSRrhRBLzzss/17AgKXGohwPvIDA1dpsxGZ3wyJ4nRpY7/cRqecC
	oFFF7bFExAOTkINW4g9J9C6urleSHf+3PNTA7GqVidDGSzfo7WdXPK8326+z4q5E
	XDoMQUeCBs5WoOAa5jFZzj4a21hNl+UuLIW3H9RvS/XrZLxIh5w8HsQtL+gUI/FO
	v4BytP0FTzqA+xRCSCwl3iPL9ky6Tl3Z3RsUiVzl9wc1zzlw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq0hqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 09:49:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84245e2bb00so888505b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782294586; x=1782899386; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmWx5mlplJVO/aPdm2p03EimgzhiIPG+EYrUm6eliLc=;
        b=bl1Sudi8m2XIVuFCdl2SFnvxmdCoLTO1zUv9TeK4BK9Yfq6UO2TG/H2XdS7Qzca/ak
         VfJOctVlhlCl6z+YjoAyypD7Z7GUPaZ8Z2PqlcuubNeqwojWqW8XkfHdD52oUre7rFuS
         gPKjJeSgqlZk8phzxlAJJCPkepZoLGyCT1YuUuzJJk2FyeDdPuF/qseaJWsf2deCHXMG
         r4TsC/8P1ztEppymbkWaMYW2ewhHpG5p+yuGHdKSHDNJpCZy1ti20aLaVdwWEQCRV1e5
         M8vcR/DGOBoUpG/Y4WbO4iFx7RHi7Q52iNp+yLXDycPbRlsEtiYa99xlH0mBoqY2HrUt
         1bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294586; x=1782899386;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmWx5mlplJVO/aPdm2p03EimgzhiIPG+EYrUm6eliLc=;
        b=Wf/FRRDLpugrFzE90/VwA+j1rzTIAJ3KPT36Hl1wgvY6SE8l5Dgz2PfmD/4NH0ZQEZ
         fdLJG+SM9e5ZebvhKqnVgU81sBLm6yJZ9NLyFt1InUoluw5m4M/vOxeNU1iFIxPi6bna
         tLN5IJNKbBGjxhIyURF7qGq/8PCeauR+HI1GoAGD6tjeaIgVsproCGprWtczW8IbluCw
         uFrZSLPeg6N0PgFTQY8Lvq2jqznWWm6t/kPOjNkQWd8rA4NR0Akd/RgpPWjPLRTepKTV
         O26tt02ac8hbEuuuAtZghKRE5wyRnY+Kh/K6yTXknkH3ykRfSjIG6/lvDzRhua3PDZKP
         yyOw==
X-Forwarded-Encrypted: i=1; AFNElJ+X4YjKBmy8/iEpe6KYolRFGZV93qCl2BBlf/0izYlUxLwXJy0ChfnGJ8k6tWugmSoRW3HoHmnkxeL6cr46Z5X7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4KZqDDjGoRQfsuE1ftVGhkN+loOtyfsEAnzozrEguj2BKR+Ph
	YwgqKVjDJdvcXAltYe5J2XsvfwtnL1JYF9qx1wvcWDYOy1CqMElW5aZHGYbnmap3E+M30Cr46Mx
	+8CLO54Nr4TN45FQjhBZaxQ4kn2otXr+LTunN+hKmStD8qTdyUmgd4nfh43w21FCsEON225VWIi
	TqIA==
X-Gm-Gg: AfdE7cnWHWpQdparhj0cpXBcfmzSbmKnAT5WSuUIppaB1UuXdWFM87IlsujDZrTS+xk
	KiOavHesYeGrEsS+QFb5VsWTuBybwieVCmCAtpYFxhu3cj/ZivBYcsuJoFSZ6BmMjWTtX5C3yUV
	pyqpZDmQX3H/S8pmiby4G1uHpintS/K6gH+jDaeO/idFRcfyKyHYL8Y3P05XerssHH7BtQLlNV6
	3CTyBUK3ZeoFVnsnOdNrDpIvJEN72q6gkhrPIHwJtw0BhOcMDYKeKsr4i1uXmsQPHabig65wz+d
	oo+8gTry0YeVZsS7hZGUFal+ud4kRK8gDiaoX7IBU+vTQglhvfWRR7nx7kMmlUNCvk+AaDphJBU
	u/dyjfmz1YUSbNSXOAb71ajn0HrvokrOcYwOoYVWE3jaa/2D2OnmMb7qpzSYvYcswrFf3DRYiVw
	==
X-Received: by 2002:a05:6a00:1405:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-845a2a76d70mr3347722b3a.7.1782294585851;
        Wed, 24 Jun 2026 02:49:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1405:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-845a2a76d70mr3347676b3a.7.1782294585393;
        Wed, 24 Jun 2026 02:49:45 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb7b3sm2161302b3a.13.2026.06.24.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 02:49:44 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Fix traceNoC probe issue on Kaanapali
Date: Wed, 24 Jun 2026 17:49:24 +0800
Message-Id: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACWoO2oC/42NTQ6CQAyFr2K6toSZAIIr72FYDKXIJMLgFIiGc
 HcrJ3Dzku/l/WwgHD0LXE8bRF69+DAq2PMJqHfjg9G3ymBTW6SFzbDzb5yjIx4D4RRDowmRhZG
 KzFats2XbZaD1KbJmj+l7rdx7mUP8HE+r+bl/jK4GDTZElzI3VdlRfgsiyWtxTwrDkKhAve/7F
 +QsnJnHAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782294579; l=1063;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=VcP/Q4tJO2REh/sFJ+3sJ1plbn436MCaqHKTnhy6iLA=;
 b=wIf6sFcLx3XxcdanGybD2LYXgyMPABJkNEpu7/0s7b5C1LFcMoeY6yDYGekgtIa7WERZ+kkf5
 Tt53FTdg/qEDaLwlsKpM9HQiJnbI2UnFNwoI0a6JJXCsgkBU92H2Lxn
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfXytvkiyeede+x
 f4jdbqGCuABJfE5mNBcjO2dDMppkTIr30XxyvgTjGKK2+c0D+eHO26mCMUwMt+Fr6+jqa2mO6ys
 X5tCVcRTf/k7kd6wJsfCEj3QL+xZK0c=
X-Proofpoint-GUID: GFpfgo95Jo9WrMXtJifrmFbW6vEFQa4l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfX3XhVVhDDDb79
 dficrfW65gm3xlOlJe49e13aLMJBN1BtwwWGmfjRRpS0KCRC3ezDkpMxA2miwfttZRxzJDsb9cH
 gj4OvK+BOb3Yxnws8esdf6f7z8uYbrIw6j1RNamVxPHaG/LmF3m79rj9H4hDdBASIwrHlw7930r
 +YAUCqOMP20AP4R7xz0fAuMSIc0PF8LPLY3EGMXNefSi1fnDZheH1//FNr7u8l0UiYqi3BeiEvh
 MO14bionEMlRbD0u029jzdYX/4kmAXd7Y6xUDFpnpKYkbIJzomdK4nfYHAsrE97Vt3Nj90o5mVw
 BPQ3ihVnf420tWeQrkcTvwv6vNmR6NJsRm7tLMqtJeyallc/+KMxXnHgdfuodXz6M62Ucx6AqxO
 Q9AeduiiJRcMO9dg4xX4Z66mTHMaLg==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3ba83a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UTefLX4YHh8himS-NM4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: GFpfgo95Jo9WrMXtJifrmFbW6vEFQa4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_024949_241176_71856C5F 
X-CRM114-Status: GOOD (  13.69  )
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

Patch 1 changes the binding to allow the TraceNoC device accepts
arm,primecell-periphid property.

Patch 2 fixes the deferred probe issue for the TraceNoC device by
adding the arm,primecell-periphid property to bypass the AMBA check.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- address the ATID issue reported by Sashiko.
- update binding to accept arm,primecell-periphid property.
- Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-tnoc: allow arm,primecell-periphid
      arm64: dts: qcom: kaanapali: fix traceNoC probe issue

 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi                        | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


