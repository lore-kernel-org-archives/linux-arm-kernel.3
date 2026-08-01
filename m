Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13BCC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsukewO0eI0l6jK8XVvpWzsRb0aVBTIjoC3cTdvO5ig=; b=HbQbEopD1/K49tcPen2eIHZZDC
	iiYHaUqaeErqzuoyGDIn+jbtjBD5VBzlNwMVKc/PUccBTSHTz3qfW2eE0K4qsPQUFhuKIiQOFY3vc
	sdXFNZl4uV8Nr0peEdwvC3lbQQUTQC2yxzRORMRfOIWaOy1bMbGgejrzMm+okqf2q/MSZUMZi056c
	md9lpDPEujmpydImcOkp/v0VnO5AEtSyVMPqL9IZyCsFbWogHr+KudFGXA/+rQiS0erdVszauB/0a
	uKoGgVb54qGr1O/Cu8ZKKKkb4WZPr5kP31Lhoj1b80nLYNYfvwdHi0QPuZxkkLy2V/yoGg5dTIv1F
	XT/SI7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGtE-0000000F5DD-2BRa;
	Sat, 01 Aug 2026 21:05:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGtB-0000000F5Am-472A
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:05:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0BFS3739221
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WsukewO0eI0
	l6jK8XVvpWzsRb0aVBTIjoC3cTdvO5ig=; b=OxOSwa2RZu8VgvP1SxBspK6/ltX
	uJnci+iDcyWlyqdbrbeMwyDplbQviOW4QZths7lULAcpnuq9vk33gGcMBnlDhJCB
	KAWg0pdURNqzLN75VfoHMtS7nz0kksLBwO5JL//RQ0JGMZcl+LzXtNaZ1L30JrsW
	1UPORUlqClE/6TEDoQPJcWMgOZQ37zkqGPk+UkD/luI/lAmLUVN/TKaKVlbgbgK2
	d+gzjrsc3FcKbg4Wkjmml5nWhknTSLvCvtny0BNdi9iMZTVZ88hTrcBNoCKETFmf
	5OPnquzZEU4SRPKaiwW55g8ODZssWzFr0zr89OqJAnAgq48OeE0Ksq3qdgA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u99px2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:05:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c083f1818so20922801cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618300; x=1786223100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsukewO0eI0l6jK8XVvpWzsRb0aVBTIjoC3cTdvO5ig=;
        b=h2bxzwoGb7zmjJIUV2TMWMgzf1voiOpjhBSxlnEZ0+EC0uGIwX4unQVotUwJpjQKi1
         PtI8vSks4JnBmAaiEmKdBJDRoxt9ENFNt2W+NOPBLw6zfWDpwKypyX3O7PBOwsms6hyU
         4gIZO/Nn4wjhbd+bfb9dUZJh2r+10Ks+LVYrurxKQpQsmV0VNsG4EBuZxyGjtxp2xjgq
         u6fmyw44Wduq91p5QLYaxMYmya8MM3qsew3+RjXd7tSVjPB26hODA4zhL9eqYi4FyqQ4
         bjrcoGAS5k5xhioTUbSag5HxZPxKQEaIAODESf+a/HOVRp7LxN7fNaxHwMiEvH7zufl0
         1aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618300; x=1786223100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WsukewO0eI0l6jK8XVvpWzsRb0aVBTIjoC3cTdvO5ig=;
        b=RVadWbIdF1pRCEwfRGS0eU6VoBqawz56ccnWBmlACVrk0KIXrqEhQfzXUINLz54Uo9
         eBqEXIJZnxMbbYz6gO+lMsHlyrlqtv8SuwxUeX4mxMulKkSiAZVvZxeB25wNE0BY51UN
         tQOun0/tUxiKh9Iit3k2dCEFBpdrj6BUXecqEtOD8045xWT/7B60Lte0lpn88e1Gkadz
         Gwi056DwipxcbIjrNwD+1koJsUT1A4voqJAODdQW/CMRjU/HGoYo80CLK5RFS+ZBVRW9
         CnP9ry4L3ANRL7Qq8B383H0G0tejJFayT8VFkN37C/z0PSYlEx+jzfHDx3pCPu6mTdUi
         euYg==
X-Forwarded-Encrypted: i=1; AHgh+RpPO58g0hFhrWyqZKb3yhgLO96+xNvsq8i6kJg03eaE+ys5nhPUj9GPnKqT6uC3i+HkKLFppXKnkEvmw2euhGhk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw93mIXHRb57jamKdenIga0uVVez+MkzLels2JgCovIlM2L59eQ
	n3BgtyvyeTWt61UgtRypYX8YCIXZE0Kf8mPFu77awIUVqBiYJiUZ0Veou2rwXo0azEjcHdXPCtT
	pQ6ozBlsnS9+RubQEnpGB7bC0J1vOq67phbp6ueJjB/GoNb3bQq4TK1fjVnE2+mlKyhTxF6/S5A
	nmaw==
X-Gm-Gg: AR+sD10j1RR0DmqkjgQiIZOvgS0YPMuBX7SWVtKZzlFnMgfg30qGIVKhlVPwMkuvZOx
	QJn1W24RmpZLvEViDoRZgKDLTIJStEL3XuKEriUx+c3jftD+SCwXqn1j+o+C9BKTC8abEiymsMQ
	3fFbyuf8fj3R2xJs57p56ViyMJay3v/BQQGL+6BPvAvhykvbjYidZM/Stw3NHQ6CgMN45eElbS4
	N090oTIPJact3X1yNjzHUlOqdw9oRxwfivXMT4VOtTn548r0aqpJX7EqZPlVG7QSk8Ppt/VWQSz
	9SKysPaD4erxOBDl9r1Hgg0KadsWbyGmGqz7mJe9a6mvQ/EEAvjlzyxS+vXn1KilJQORuaqefUs
	RAg4gLnLStRv5U34a
X-Received: by 2002:a05:622a:2b03:b0:517:72e0:612 with SMTP id d75a77b69052e-52b567db6b0mr106495781cf.42.1785618300379;
        Sat, 01 Aug 2026 14:05:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2b03:b0:517:72e0:612 with SMTP id d75a77b69052e-52b567db6b0mr106495521cf.42.1785618299991;
        Sat, 01 Aug 2026 14:04:59 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm18005029f8f.5.2026.08.01.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:52 +0200
Message-ID: <20260801210450.384087-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210450.384087-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210450.384087-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4623; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6DN3cudpMNa0FqXjzZDZ0I9ZvjzIIoYk3vLPfHgk8cM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9ztNq2fXddHDX8u5HqsNSYYzscFtqNoJUyc
 9XycnzBrz2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fcwAKCRDBN2bmhouD
 1y18D/9nDYUV2DWRFcIMycfAUnMUchXfs2U/i6yZ1NOKag8nrJRkb628yagdboa/52TIREYitlR
 CV3Id9WfgwVN8PYq8RlpcJzrq6g/W1hKgV272eCF31Ck8HVi1+mVk5Ko3LYCT64vIoTveTd08XB
 rCxFYYYKxyQ8o1a83mnrvCHZskbINWqQd3kWKO45pFfLmdoiIMsGu1bdcmQC9h761cNUNAjfS0Q
 0CDHZqWd4Y82mp0LkL8Sk2lZg9chEqx1gutQCr6JLb4lummafKn2RLaoi6Ua63pK+R8iqStNM+K
 fI88lb3sEUx9yLZ5/w7thXenucAjA3zbDoS4ZKkm71Wj2T+T0q5ctvq91pJz0mzFmvu3vPt4DW9
 VLJScoLSPZHOmT3z+4gTJ5cYHODfL5LwQgHIKfE9qBGtuMvvrJEIN1bV4yD/E8e+4eIgZwnFZQS
 kMpstjsn7yNnYF+aPyTqXEKCnBrNe/q8QlvdCJO9vFZNuw6GuADpOu2GiPz42WLiVFMS1W5T672
 Gkn3ZNY2fJpGIXIakK7ZyqLZq/MI3je4t9OKKVyVnffFYd1mFxbM1+FOtfP2/jkYGzkrHkku6cU
 d9rlyyPsYu/BuMtCFhLrCEDO78olXGWSxVZffggURAcGe6QCIgcNn9kYuP/Gsk91b9kgWKzihtf UNOABoiL6KnOSgQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kzdrD3SJIy7RkN_cW7G-TVW_kOpN5Byl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXzpmP8YM352fX
 Q6J8YCDC2dtt7NHnHLBL7ngQ2tjOml/rTIuPbffVyVEwD5lEbNPorPiMYXq8737R3aywbpAexGM
 Pmfh2UEaT6zYtMrjY+AEgUB9EJCZtSBn0NasGKX/kRgm12zXRYmT2UZ60Eo3qQIg5w6yNoUEecH
 dbWI/J5OyD1lUUpSKY3MvGhABsSZ48cmlikMuD0S4OOmWrDuiIU3LtpZ/SscNNJ1/7BoOdDI+v8
 ++HwrOILQeomTgrm3YstWAne1TR+sQ7+0M7r3+mxr9Q07dheFWrzD6Ubnt6c8xP0tOnVAK9x6jr
 L/WBh10IgoJez2nhMhPta7Z0LkjNKXvy/giSEqcNjF8UYEaTt6mdlbPLG8LnN/K3x5yk14XrEWS
 sCpeXPuwzqGogjQhSVBEIbeh7bxzhOX2fDtktDKWKqz4GCMe12jGNwpu0xMnc0hM11tPEDqdzhQ
 JJbtOzoBdW1PYd49naQ==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6e5f7c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Hx2NUBF34izpMPi2HQAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXzXCBgJrLV8XE
 YTQP5uFw48WDKiLJANpdmfHggzhG6xSLqbMu1gzrD9snzZ4zDca92MFmV6C/oxyJuG0gv0fsFe5
 6w7Unz+vpNQ8noAiK/u6LNiJ1zuKo4c=
X-Proofpoint-ORIG-GUID: kzdrD3SJIy7RkN_cW7G-TVW_kOpN5Byl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140502_311477_5AFB3C78 
X-CRM114-Status: GOOD (  15.31  )
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

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi            | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dts | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts        | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts  | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi    | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts   | 2 +-
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts         | 2 +-
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
index 6d78a1c98f10..3b9ded8375dc 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
@@ -49,7 +49,7 @@ axp803: pmic@3a3 {
 	};
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 
 	flash@0 {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dts
index 6e30a564c87f..5627d2828fc9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dts
@@ -48,7 +48,7 @@ ext_rgmii_phy: ethernet-phy@1 {
 	};
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 
 	flash@0 {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
index 0f29da7d51e6..6e57ee19e799 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
@@ -191,7 +191,7 @@ reg_vdd_cpux: regulator@65 {
 	};
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 
 	flash@0 {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
index 3322cc4d9aa4..f9fbaf6df237 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
@@ -103,7 +103,7 @@ rtl8189ftv: wifi@1 {
 	};
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 
 	flash@0 {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index a8644fb52b04..0d3e761f6466 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -99,7 +99,7 @@ &ohci1 {
 	status = "okay";
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index b340bbcb710d..ff9b40352a54 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -149,7 +149,7 @@ reg_dcdc3: dcdc3 {
 	};
 };
 
-&spi0  {
+&spi0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec..43e8674bd021 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -403,7 +403,7 @@ &rtc {
 	assigned-clock-rates = <32768>;
 };
 
-&spi0  {
+&spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pj_pins>, <&spi0_cs0_pj_pin>,
 		    <&spi0_hold_pj_pin>, <&spi0_wp_pj_pin>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 055be86e5fae..26ce579b42bf 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -400,7 +400,7 @@ &rtc {
 	assigned-clock-rates = <32768>;
 };
 
-&spi0  {
+&spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pc_pins>, <&spi0_cs0_pc_pin>;
 	status = "okay";
-- 
2.53.0


