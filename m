Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725C3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p3tzC48OMJanQKDzI5y1cUzDIjAiJqSFlg19IB9p4DI=; b=ua6BQGyJWMXYf2TVgKEy1eKzS6
	tKsdATvL8UnR27rWrnMn5tSCWQN1Kb5y6ipx13u0h5vKaoYUt6mJH/JKLcTVAPvzWNULXZbnKMUke
	yUvdutJIiVrPh7NY+qmNRzpRqlpVg2JFxdmOxjCKMWr6txTGgROyOffK7fWJHGkejlIxRgOL8GK9w
	URXUxMvpU8rAo7ZkMoqBAHP6pLBZf7nHDXp33CPQSpKUJonEtx3DpIT7fd1bYZUarXK2pLTfNtvFt
	nyk9gJ8JFYf5zozZHtfbQLrYQtoukYwEot33IKll8vWJGB7Jo+c1BWhlLuhkq/Ly4waADSJgb6jNo
	5z84tArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfiT-0000000C2kc-3PRT;
	Mon, 06 Jul 2026 09:34:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfiR-0000000C2kA-3H70
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:34:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693rto107424
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 09:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=p3tzC48OMJanQKDzI5y1cUzDIjAiJqSFlg1
	9IB9p4DI=; b=N9+uL1mutwvIVj/uDGOUcNLgEVfbhjvJKNFpHFfRTZvw0X9P8Pq
	NqhVIgJqP7a8FHj2ksmAhUP5m/H4P0fSKhHV8hTLo/tFiE6zQqezIU8Ln6m9iotH
	9Mv1n3SJ6X2/Iz1rBvnbYgPe61tEiM4+74tcBDbH/e3Utxzspr9lzZopDuJ2HxC8
	DJk4dw4ih4gQqvNVw00oknqglqxJETIhf4/100xKiJ5bpRWfW72+L92RIOsmF9S6
	6oe26JdDDBixIaZqEb89fwX81N7znuQQ4G3Z1ZyuzspOUDCBTe69d5rzMyWB+yGY
	kQO2CDNgBtp8XwO20HdONjvlBZrYoi48ksg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur6rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:34:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so246958885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330454; x=1783935254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3tzC48OMJanQKDzI5y1cUzDIjAiJqSFlg19IB9p4DI=;
        b=Qkpdb9MAFAY8N5FZhZAN0juyeosLrjz/NjiITioiOhKSgPydE4kAWl0p+uS1eoY59G
         4JHixVcZ/gQHRxy9jaaUXAbMVPx1i06mQmHf7lvI5zoi4q7Hxs4hEPah1ZsMof9YYpMF
         FwrtbQRuVBQiMpyBmn+6pVBMuLoealRqGoazFNDwo5IbB4ev2C/WrWgH35u5oSAMvkSk
         XlBrZsgoA77BWbnDqjH8eAf44r7B6yxJ/X2KUxT+9gDhMtHXNDM6OYYKP9sNWcvKDyrw
         B8fa+ebOX9kdjGQSzSnp2odEayKzxOhmrXePN+QCmFdpjPH51Kaw+O2j8YqGk3qV3PLr
         sV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330454; x=1783935254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3tzC48OMJanQKDzI5y1cUzDIjAiJqSFlg19IB9p4DI=;
        b=O96AASAoyaBCm1kUGAyHYxXof/maTNDd0aw0+G5laGY+NVJwT4i3U/Ad5hkx5eQQyz
         pXpM+tuIGorc3EVKX49pFswjFxQ1s9NAZeEKeSgrC6I9zTuOvC5LThvrR+Xh+iyiamIX
         4of7h7UedgLgOcMWEViEx3Sp4Cuywwq8O4f1bnRNu2M4CyTm+IW/n9cfYjbhDnbDRWA7
         iT1NZNIExNfrkWSjNAsUBBNU6+fx+c/3iYwJ7GAWNjygg9+5JUqt/Pe/H6Jfs2p47vK9
         0jlKIvpRb+XnUTGJmfGt2q+XJ5mZv3zDuwWt9aOf7Ad3/FNr9jWjyP8DCCmJsTnRP1iy
         rZ3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq4OlCizLQl4ZPI4Oy9hW7m8P2W9ST+jHc1ZPtWQVYbeT9dkemMByYp0dHmUpKPAEKDeW+9jhWvZ9EPRoDpOvdt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj9AKVZA315nZY7E60u2MrsBbMLIga/oxoNz49LqMhnIQ8HT/c
	JQsb0OhyUZ1y6u1fPbd8xV151mX1lhCFQkuKEy68PYP5MmukuZNRS6kIajWYcxhqgVujKDXiH4i
	W4bhFfLE14TrXi/K+Dm7ZaTN4/JOmgVHeD2TjtswgSkHrMzSuBOhHputKF78PSKVnz0wjhjWc5a
	sVPw==
X-Gm-Gg: AfdE7cmLeLy8hSwMt9VMXfhwhxF1gnIyhHpvp34qe4lGVoPo+Wx9FcK/wKfPNp/XQU/
	KGttx+4CCbZMtvReKBhnI/vrSSoVXBWd1USXXw0w1Ji4LRCyVK64Y+a2nAkbXj2zEOnoY+Q+cGE
	k/d/y6Z07hut6Z2O5YaGx+SzEs0sgYmLuEQoDnYoyKEq4dDJNLtImXiFCY6+O96K08r4RrFyad1
	Jpn0LS1bIi8zTWftEi9zYGoy05B54p4UzBzmuDJTHUXVPZ32tu7xwM+7n4Osd5MIy6olh2Didbr
	hIfSIjuMA9QcmRNUGwISZUlbJyxg+Y8cNJpeXDfmF9SNnovP7oemBOPn3k4DRBi9tTSRQahxJA7
	ih+95MQBupPPP8vtTLO+k7TFeHho=
X-Received: by 2002:a05:620a:31a7:b0:920:6061:816d with SMTP id af79cd13be357-92e9a1914c1mr1202633485a.0.1783330454179;
        Mon, 06 Jul 2026 02:34:14 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:920:6061:816d with SMTP id af79cd13be357-92e9a1914c1mr1202622485a.0.1783330451992;
        Mon, 06 Jul 2026 02:34:11 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6381e4fsm413613285e9.8.2026.07.06.02.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: xilinx: zynqmp-sck: Correct indentation
Date: Mon,  6 Jul 2026 11:34:05 +0200
Message-ID: <20260706093404.273569-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VGrNW9Fw2ML/soYGG9SAl1ppUBPsUqheNZ+RTBwlNBA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3aMyvfbpfbhSBooS9iIlaWXWgQ9yyRJb66Ib
 qaC8ltlPbCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2jAAKCRDBN2bmhouD
 14jZEACADxyCw6t+grIXqe8pa1sFGzNqiF/3yncjGj0yd8XD1vqF8lD+zFM8DfyBpI+IUYcKSwc
 JL5Pi58xEzxoPnfqSki7C/rkCBocGa4IWMxxniBn9wPoSH90pCSybi0KK0ZPYtX9gJVFvmg2c8q
 CTuG+DGnCNRL6zm+JWNIFtSvLgtYCErQfEtqHQnMJKu5BQWeCx3C7Yp84B65GYuUe7RzWnsldUu
 XjKzK7euLYySUybw3EMlPh+m+ONArVx6SZW8JFd0X/m2lc1L2Qi9twJgPAc1zizLCzidp0YVlNf
 lj8Jex41WxDf3Tvc3UB4T4y+0KzYT9Z516LCpk6FCNoV3fSYAJb7xrPG/ezZuUhNZGBIrFEZaRO
 LeP2I+kjqb3/6axhFhoNwSMe+WBt+eE2hoMxMy5RbRt5S9fSN8O2ykuT4KwWJdPXIjQie3Ih0qC
 6pU312tPiMM9kYpyoIXm5s869OY5tla7nsJzo5lK+6L53tpRwaJ6pYtjpD4We6uT8KpuvXSjnML
 5XQjIYTxiqhKt35C0AVlz32GMgq+YK9DiROGlu4S4hh9r/MQ5JxIEMqeck+kxVJEFU2kUTJUOVA
 9fsvI85w3MbCdbt6YRQjsYhqJ0bP+0j9sFdPOd8b7lujjUH7ICAK8bX3bNzRiueg7Ko33viOfsv lvZdmFnnfzsLPLg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ITGpaI0CcJ2z--4NPOrFflnlwAiLq9gY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX9auqIbDolrdY
 LBorBmq0exE2mYavJL+XjacF6xTtSK3ZgN7n6iStJB8fhc1oQ59TUjXVi3Um+At/ObToX1gu/iN
 /lMBIXf+Bn21Q0TZFc5enRLYoxNVfh8=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b7697 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX6I/BFby5ANBJ
 u/Xrmh6TqhOJManOKAG79ebbMGtdinoOI266DIY+w7pd74mdPDCVeb5xxoRbGsJxqN+UkWcsoac
 K7Wzqat4oBcg6M8LkOUCizOOKvafsbbfdxOkAhfb1ERUgUf1eneVu74SNKs7pnchSPLo+xE4flB
 ANq45NC/QkbqEq8H7hsFyzAV/WpQk8hahbnIxsTdDBAAHsPpHmnyFPvLuK9+y9KcXB3Keokk9kk
 3+tZxnoKOq9KmdDg7Qhk1bWTUPLPGAs96vMo9+uamCKI75mILsv0NjT1RMonYpt00g10+V34Sxe
 UY1KjUO7Ak4opjZChgZ6S5cY4QFgDT6Tbf4XE0zrzV6xdxu+xEudeQMA9rhFrBkZfA881wdcNZM
 ub0E0NL1nPqX1iCCeXBYm/PUG7vNwmk3Bh7S3wl7+pbHg+icjRI/DMtz4aPvo5Dv+fluxIcdoDl
 XncWJGQE57SURl32YUg==
X-Proofpoint-ORIG-GUID: ITGpaI0CcJ2z--4NPOrFflnlwAiLq9gY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023415_819954_D4D338E7 
X-CRM114-Status: GOOD (  13.11  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index 44834bf1c19c..52954761c9f3 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -218,23 +218,23 @@ &pinctrl0 {
 	status = "okay";
 
 	pinctrl_gpio0_default: gpio0-default {
-                conf {
-                        groups = "gpio0_38_grp";
-                        bias-pull-up;
-                        power-source = <IO_STANDARD_LVCMOS18>;
-                };
+		conf {
+			groups = "gpio0_38_grp";
+			bias-pull-up;
+			power-source = <IO_STANDARD_LVCMOS18>;
+		};
 
-                mux {
-                        groups = "gpio0_38_grp";
-                        function = "gpio0";
-                };
+		mux {
+			groups = "gpio0_38_grp";
+			function = "gpio0";
+		};
 
-                conf-tx {
-                        pins = "MIO38";
-                        bias-disable;
-                        output-enable;
-                };
-        };
+		conf-tx {
+			pins = "MIO38";
+			bias-disable;
+			output-enable;
+		};
+	};
 
 	pinctrl_uart1_default: uart1-default {
 		conf {
@@ -392,9 +392,9 @@ mux {
 };
 
 &gpio {
-        status = "okay";
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_gpio0_default>;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio0_default>;
 };
 
 &uart1 {
-- 
2.53.0


