Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B0CC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ILIOUd1+9kSWEGJ5b/2AYjVfXn0sjWle5mTjxTvHaQ=; b=gSPP6mpIVN/HpcvtP8RnriM8nc
	ywyEpNpe9keaQ/YeWlkESCn3VqqvO96G4PAG1j2mWBBTtFnNJIT5jxXDJtfbuczAGWwAwsqRZP0AY
	Cp3+0HBIM2ptSsK05mOu4A/i+0+9RUSc8Oe5S05vzVnubuylh9KHXfxX9/thsf131Y6UKB/L1S4EH
	Ui2mSDilUY9DUV171aQUeHmRslrtYOGeMcH72gaO+nBC1AnuQDHSxH7h2ecNNipDm5kRbwWYiXv3r
	7Mm0dDdEH+jJGIOd9iAQJXuSQUcw4KIBatraSphqpjcBTktzfRN1tBp/L6MeRVQxDJfiL6o4OUALC
	yiXvmy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqonx-0000000Gfg0-3OWT;
	Mon, 03 Aug 2026 09:17:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqonv-0000000Gffa-1Ewe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:17:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bXIw3957265
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 09:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9ILIOUd1+9kSWEGJ5b/2AYjVfXn0sjWle5m
	TjxTvHaQ=; b=PhVGF0X6zlYiODI5cQ+Yw9/piNp0eZ+laGtU1A+lvmoq7VkLvv0
	yLNamzN1ujbd/fbIkIGWEd2Ph8D/6GiA6D7Fuxi+yJDzYQA/ihk4q+rxlnYkwFLn
	Smj/qOpcCcuWGqgOH3VlzdLJhwglgVXuFBm2RrBZaNF7n2qqyILRsASLQB9De74I
	fFnU0ydJOKBgCITV8Xac50J7uRBkuaz3dXTWerIXiYtj9ktZveRgCm5mq3SQDy/t
	0YyBp7EaK0GRkDc/SLcTFcLa9QipawJ2iLxHEMZ1r1W02wJ41wY5eJvz5TWZ+MIa
	bzUQL39muhEmBeMTtIMXRo4UxEGWIkLFvbw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvngqkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:17:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8fc92c5373bso33748986d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 02:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748669; x=1786353469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ILIOUd1+9kSWEGJ5b/2AYjVfXn0sjWle5mTjxTvHaQ=;
        b=C4BAdy9Nbe1t/f9pFY8pZP4AwHuzvZ1PXA9t0tZTuH+Uh+iVAmVGOizwhvFmDfPpWl
         +bURUbppZGW7dQgQ2rH3AJA0GnOB5sevq1KdCbyvI60tVxYt1qHQBD+S7lxGGkf13l2O
         4rXHXmiXSIyaUZpkU1//Sj/ZniN/Vxd2VdKcaJ90EkHjjzgWBMT1VETnBsFEatU21tq8
         i7pL/F77d9blNXE257CtHAZ2AH1Zvr0mj44pc+Sn6DkLFzPzbjR4O3UgHZjmdYBVQ09r
         XGzvynml+G8e3IKngMsh7Avjlue39yVt+IN1B2b45rDIpPMja8RtDcrApHRLO+8EjQh5
         cZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748669; x=1786353469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ILIOUd1+9kSWEGJ5b/2AYjVfXn0sjWle5mTjxTvHaQ=;
        b=aT0CyLhzaxX1oV/H3GwFl8K3BZhLBT5+AQ12MaCajUtKsgLCg5lvrmNF/xUjL4ZSH1
         JRa8FxiphaGxHOogPjw3I2ZXNYIW+xrgANSZF+1cy6esUR84k+W9tzs2eKPCTIjh2Bcy
         27WQMNP4e4UcEdGD7mfVEfYqRvrEuLIFhzd3e8a7NG0J3/i1qxIhrDsBQ28s9iuPc/qO
         +0Sw2LQMRi8kPaFNIXIpIj/+RM8FOoGT5hvCfxXidhmSyTVUxvnZRGQPRqA1q5fjoASw
         BiJJw1+HJb46sI6QPzoxMMCl2H+dvoCeLO57IeDyIjyG7p1bb5a1I3Aw00UzD8KkhcUb
         fu0w==
X-Forwarded-Encrypted: i=1; AHgh+Roij1a18m05o5ahKYQZXgLYACoftfK+F7b4sjJxItS6HxWeUAdVrRTaeGfLsBY3tzipZvsw/IYleSqzK1TTJHti@lists.infradead.org
X-Gm-Message-State: AOJu0Yycwj9Rq1pFFnSdelVquW5Q6KKzUu0A2IGOwhmZTBLYm2KqAtQD
	0nxv64l6aEhHAeDrx0m1wUn93KwKHruVMxitPvnLcXzqn761TslGSc3bLu4p628NP3VBX2HgqWt
	ckuNZBX30k5Vl8UaAxZuNbAMUrUeqyA1hwdg6Rb4LCe7KgxOl5Ykn4I23NN9r4zcnoCraIFJmry
	GtXQ==
X-Gm-Gg: AR+sD13v2GlECCTFJJ228zMa3uIYg+Aefo6rD84gy43rn3MLK+qkfY2f2MQkR+FrMhD
	8/ID89lnzAwa07C43NMvN6ouHghBwQsP9gPq6ZG2MBnEULS8uDdNhEsX+IhXZ13JvZULJ6dW7+1
	BZx3aXimJ+wQF/Hy0Xni92Bo7f5YgRpm3GLypjqHj4EmVmCBDc0SgO72oSMZU8tytJX/d09Pvx9
	ZwH/+kiMWapKDjX4R+WQuHwiEe8sDSDxwgjf0LMOiBu78ki1WA7PGjlYtKLna9gTxNKpb6mP8n8
	elUw0/trsR2quBlQmRQv4dbpn7Ibib1hnrujJJKavYzFHKORgsrZKegTteYd1pRyUkOAwCeE2gW
	ByDQzUaWSQ8AmeMiv
X-Received: by 2002:a05:622a:1214:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52b56777af4mr169109551cf.27.1785748669399;
        Mon, 03 Aug 2026 02:17:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1214:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52b56777af4mr169109061cf.27.1785748668765;
        Mon, 03 Aug 2026 02:17:48 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2961sm34636955f8f.13.2026.08.03.02.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:17:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] Documentation/process: maintainer-soc: Mention expectation about dt-check-style
Date: Mon,  3 Aug 2026 11:17:41 +0200
Message-ID: <20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7tObqCPMzjUbkFLV5jV01Q6RuX4OHirNpsj++DKUtOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFy0UG+dPkodNTdXFRBRzXijTLDSiofm3qvCm
 +CC05n7edSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBctAAKCRDBN2bmhouD
 13VSEACWf5BxgM1MPzs3SLlZHSkBJOO1mrOcICYXTCj2UBu25FpFzZJ0cQuyRYs6c3ytPFXBJz+
 mKqQuylHd9dTGFMgCBnoR2Wdp9/RDRAXpMwPWQoOmVBFZPThU5RX/v2wbK8Ax/441CzZaxD4eRa
 1FhFuSYhdJlbeI3BqMplkaqIwbFOtgrmJY5HOIJHTQCLRplxG7YEydQ3zEJoo0h5Xp/ruyjgShc
 mjf19HoLI2h3OCOZROvwvwRSQ4OTZ7JF8A7Tk7DYSl45um/jgQn4F4db3TriryvKSSzx28eQZzS
 x2Z7s+gT6yQqHKyoTHyv4Thn2Lfb8yYrK/1QpPFqhBLT42BiBk+GI9mdvBzLrU3K9xidHDUjAn4
 cUA0tD+F/HIZBvy/pLrfLE8XGBk0XYDIeUs7XA5P2Stt3QLya1dy51hQrlPdTTeYMg0wA9BqAHr
 jkFGS4GPtV/MI7HszORjyfzI2umXiFrbiZaPdxhf2UefXZKLpyl6OM9IdVjoBb5F1pVoV+oH3yG
 fv3ViAdfvdRIctv+8YP5lkh8a9soJ1Ldhm8kgmLVLondNx58adtJnzLiF5LkQQkr6nT7p9i+Wot
 d/LQrAzycObnbm8QF1mo7pnUjXGy2cf7XokenDiNfEAjhE5W8LYIOup053kyWm/D6xrWEhNIQng MBlArMunvGyhdew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a705cbd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gSc81ffI4h0EHLWcGl4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: NM89hWAIOBPFy2oGQWr0zvXy5bY-lcss
X-Proofpoint-ORIG-GUID: NM89hWAIOBPFy2oGQWr0zvXy5bY-lcss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MiBTYWx0ZWRfX/JNMJjJaCdN/
 ITWuW8aypBFZp0nDCYdqmxEF/CFm0vhSosfYnBGdHgbtWlVB3eWUuDM5dL4QcnsS951MRR2nkNu
 H25RB1xmFmpEPXTGiZSL2Fynd512nReoIZpmucrtDxqGuy8tcpwwEVWPpxMMmrPgJqEucicOrIf
 3qGjuC9Hi1URzuoAIXC6u7e/Vq3JkAggN4Uj922RLRZ08UP0LDSMJ/0brMmxmXvWsEvlJy/qDdn
 kovL/Q6QGOQyLNTCB7zsfw5Y2QtlTWPPnyG7YtR2EDBVBwgkTZDXN/bahOa319bdWE7RwTQacRT
 nfVo+rlmc9N+p0+ljHM14iXD0oPiwn6Y1LpysX8l0rwfdEBXIovpGFuPKaeTkg9JpnpHJX5fha8
 Mk4SIgsiXgqg5gNB54LG/H39sYKrJc7sNCiv8/jmvj5/PpV1PIok9d+yKTD0MEEwn80Zc1ngRLH
 ASCdrouLBbBVEFniV1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MiBTYWx0ZWRfX0RZPZE3df0MY
 6xOEBji7imwm5+Zr0zn+1QiUBPzTY6ogKRiBM0yR+EsQyCANtZ7fuhtoiaVad48L3TrIu9a3X4Z
 TmPx4lj8fBtL+Kcsx2JCP0wg5fL6++g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_021751_455218_84C77262 
X-CRM114-Status: GOOD (  13.44  )
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

Any new DTS code should pass dt-check-style 'relaxed' mode without
warnings and should have addressed most of applicable 'strict' mode
ones.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index fa91dfc53783..96a87794583b 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -170,6 +170,10 @@ For new platforms, or additions to existing ones, ``make dtbs_check`` should not
 add any new warnings.  For RISC-V and Samsung SoC, ``make dtbs_check W=1`` is
 required to not add any new warnings.
 
+Additionally new code must not have any scripts/dtc/dt-check-style warnings in
+'relaxed' mode and should have addressed most of the warnings in 'strict' mode
+(the latter mode might produce false positives).
+
 Branches and Pull Requests
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.53.0


