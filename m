Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E55AE98DF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=gma07kJE9p6l5p8xyCpbmIPG25
	ZGE2v4pwM0ME28ILRtMhzSz2/zQIl7kWbzca1cOZY4voRpM1lnMjcxYt5eEQKxoTgCqbKk3a1Z66r
	/oy5cvI7fPYUO+mTXxAzdInC2tzr1da7dhVxQ1DstodH0IUFGc2cJ9zOKrygHCpjiCxFcAVwd/cA1
	tkZbBAETwY5s9AaM1p2Yhnu/8nei6K9yaS1YAXnU+MwcWjVlRstqTEn0GLOJG+aFs4qaQs3NMcZ4D
	D7b/wN43HbG8Ei9pPz/pOt+ff/cCuANjA8wL+VXXrkg6EcNNxRrZLroXdheAejHNfp8H0Qauy9YlD
	RqSFJQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPsJ-0000000HKqN-1VHf;
	Mon, 23 Feb 2026 06:56:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPsG-0000000HKnH-2B3D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:56:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLUJNN1335780
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=NMnOTOg8mEg4mUwM
	+uxs0q8YpfCYoMEJW/HfOOd9t7NEHdEsUdLU01alD8pQjNnr/8McNPr++AyTTmts
	1ey5VUqSRdOhmbKeo/yBXy+sy3dXcepqzxnT/EZa7vjODppbTh5gO40f8WynGPzj
	3OC5rDllHnHhslcurWpwWriSAKXp8lessI2iFpotMkaG79wGZOmSDwJAk38A55bP
	2LdDBIzKmXuKNOD7FtBkhRkLnAn2o6FvrqCInNM/3X6s1PjUMPsBTo5zpSMDJWmz
	0xPFJ8mYQJC9sWrbbm5xJIz2UyyLD9MHXoKDitF2IikG3lSKlNBBzrlDtnb1ukHA
	2xamHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7uquu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3545dbb7f14so3705799a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829814; x=1772434614; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=Rx9F7N4r+ezXebxQo/PxnWxvaI3Xtz5yk2Xr0e7Il/dzLlHd1B1GxwrCwsbFmovp70
         mP6M5zK/4bIAxlk74yNUcmwhpLWN24T6yGS8PcAOQgEi4aiKiP1W1sWhzOTyC3KSl4Te
         tpwtha3huxHcwc1+D4t51xaLuLzGiL7fuoYS93sH6AihlkombKzvOhEabsdT1XjVZgfa
         2DxnSlF1aRaXVUeVcf5RR0Kq74flVAKV9YjBCaCv6jEFgJtX2jSHrtLVFIdfqM9CRAcW
         pQ6mwBtHx0qY0DWw0FehcCxBEP0+HGTi5Voarrb0Y3JYTHvt87lX4mV/BiwLL2cp9cgp
         lwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829814; x=1772434614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=DnI6LOGF42j2Vi9SHIvjimlJZETQCx1TCKGbto8OVEo148a6hkA2oKXS5MLZT/TqHS
         7YDB6gWrYoYGbfavGC+6sbTqQDoBZ5gDHLu//WiFtYZeE/v+0NHvz5txJvLNQutuf4NR
         AwVktv+JSm9CbpAAOe8ka9aDNB9OsjGldGdbGcwoLKAOIIDQCCA+HLjZLWinTMGciuft
         QP5FM+0dVSj5LLqFxmnnOxaI+T2Lp4TcbFGGjaEWf0ixEBMScsR3j20g0/OeDn0y3srY
         OlGch6WHx317v0y4c1VVP0xfhfoN4iM61cKPb+A2YvqzwtHkhe+o6KP7VeybdWwfH96n
         kFjw==
X-Forwarded-Encrypted: i=1; AJvYcCVSJADfpru8g7hRw/4qNWTIzlEwzrlafVlp2yoVFwelE6TF0wBrgCsXM7D5sv0aHVZ/wGIG18hlZlyYawyGFJFq@lists.infradead.org
X-Gm-Message-State: AOJu0YzDOiA04nslA6Gel9kRY1Wf30Ryklrt11eXo2KE1fUqy+H/l+ti
	HveaYYSn4Sl+P3QDoYHl4op+bWUu1ykk+CVzGHm8dh5C07mAMf5SH5HeGBIE8Nvw7uzvxD9cuqU
	Jvkq1pQ4AQo+CRv6lSZD17xbEl3z4JwUor2YblLYz8TvHBwot8UWSYdEoKzxkHotvZmJx7Mco8x
	vL20WJhJsAHpSf
X-Gm-Gg: ATEYQzx9JrARdQWX6wyMZLfbD3Al5XhKN1Ea/Tpmibl/fQwW15NhY3mI+tLUhCisbzL
	ea9nbhMamgOwNWvZQUMpWst9qDx/X2nKhfkMwfrR905xTXQ9QS1GjP1wTfC63wmn9PW2q3fhpg2
	VRWvsbKnCyYZeKVLC34VAKZJcFbv7rxrEmQWGQ8kSProixXOeSoUA94etMF5rbElX1zhMOUOxBQ
	gwZT+2BuDSBpMFx61+U87xni9zDf6fcYIVHtW4Bk+ClXE9sHYmSMIRSOrEGCmO9Y7kpdWpJ+QfQ
	kos2qIV4yUnQwQ431mkufPk2zDPwCzD3XZAhZnfR201N1FyOGMygxZ9/a1sBxpxYVCamL/S+odW
	U3aVollrBSosjq4lyipojoVRyaf1SWVZ2W7SpG443mbRT78KvkuWelZ/jP1dSoxuiCdYh3OsazR
	is7j3qAgDhMfPY
X-Received: by 2002:a17:903:11cc:b0:2a9:629d:b618 with SMTP id d9443c01a7336-2ad744583eamr70524125ad.15.1771829814432;
        Sun, 22 Feb 2026 22:56:54 -0800 (PST)
X-Received: by 2002:a17:903:11cc:b0:2a9:629d:b618 with SMTP id d9443c01a7336-2ad744583eamr70523785ad.15.1771829813940;
        Sun, 22 Feb 2026 22:56:53 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:53 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:48 +0800
Subject: [PATCH v13 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-8-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829767; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
 b=GYKSp48HIz9/NsR+p3K2MrJDn8ftD02desZ2tTn7TWMAjbQfG1cLRr9feCJsN/9hFhbMnHlEt
 1C3IX2UzLqJAaPZTJ7Z9DqjHdhMe9s37Qx6TqkJYy28M/S+hDjQq1uV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfX0jY/iY4kmY9u
 Lv5qTzfHPNXXWYMRZVuNvJR4pJ7jWcXjNH1GALgi/fKiwb5LpNMzxmOaViC9WXBQiR9Po9GjLqG
 LXTfotjF568d4Ny0++FKCcM4AIo39zWGZE9Krq4uHeGEhdASknHxHLrvjfnF3svQwQO/XRCqeJN
 8KR7BtadBDakpE4zfpQBq3+6++YLE8jF0fVGhzNdegjOdMfxvcT8653gJ/ppubJEHSfJ9cSLLIO
 iV7LF77SCBM321bxC/OGVIK+5h+yKI5zCUpi3XZa6L8jHrARDJzBRtTtBMT2YcCZphT0tUW7B75
 YLTBUaw8aZxnZZ0rIrZO1wUE3gtMEe9amx3JNFGEF1vLLzgaox/3I+rAXeAfRYm43swuYfGDS0o
 +Y1y6VtxBgl+2pBA5CXY1rnKJVbz6APL5FRvW3l+0OoM3tJ+ApFWXfITyrNIXHGggsTe8Vwfsdy
 hGRuYBnqxVB0saW+Xlw==
X-Proofpoint-GUID: SJDXexPRzzuohKyNzUabtn0isp8v3KCJ
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699bfa37 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: SJDXexPRzzuohKyNzUabtn0isp8v3KCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_225656_700628_BBA5A508 
X-CRM114-Status: GOOD (  12.08  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..e8a20789cd58 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


