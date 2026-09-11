Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD4BC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=; b=LgfcjLbYsWlwAlNOiFY4xoCRIZ
	cEf9HAbEKdCKY7yJMGLJmxl18BnngdNn9hLfjVqTOvD0/t4vGR4rxdyScDm0TDT39P5r44hFm1851
	YywDn11tDFgXV2kNuxgF0Eh+C6bjxtiv913RuF+R4Bjwz9inJafrSSdZ7dN2/PiPEtZwCLdglYh6a
	CwU4V3yC9lxScovCpfxagYzy7rt9YuBmO0jMg27cvKG30QtKiFk2hLXj928GvSt3Wsxy7A1R81+iS
	f7C7qs+atbpXvk2XYIfcGrJen/RRMtUISwAoE5JuzlVsTG7kQpMqnPAGGehxINGfppVm9lYvwLiVP
	4dNQwQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMc-0000000GMLq-2WMv;
	Fri, 11 Sep 2026 10:20:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMF-0000000GM7l-3X7I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:19:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kfsi3366295
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=; b=mGrHmxuZgXMkVtCi
	8DlMRKIh6kDJfzNgMkAUsAqMAHbuJTVOX6PD1ei2I2S1vuBAMmPgDM8XwEj7tePo
	upaxFnyDlMp1opOpejlbuW6qZGz6TMpCcxLirPwkKnkvPy7bk2NIU8c6UAa1ciyO
	l3aDWtsiOpAZCAjWNZMusuBA/49fjWixQbQyVkskoOXFDuEVKRLCHfd9S+9e1MK9
	qh+DntA7aE73/EXhN+Z+tYMEWu+sYf53Sj36LsebF/2n0YNEQ8lyy6IaJTrT0BV+
	gWIYXicRPID8ddkTTPkbpJh5lGGliJ/JjWgCE+HIijbldBuLjiArO+uIvbZfo8MH
	P5FIGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2bbh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9396e0515dcso53781985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121986; x=1789726786; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=;
        b=Fi2HeU83KCab1TgBxku+2PgJVM4qS1+cNFCzWXX4T/lo0ZVtf1h0RkpG7SZ5qSuCgr
         GlrB+t/uDx+ifPxA2DeBgELXCxwk/y5YStlmjst3ooeUsjLPOcbX2MqlcD3I4NYdU7xy
         S2YsmaoNDGNd8UaETMhDw/jKnkAbqXbWuuNe5iG5Ohjerijepfu+mD92/h8W1jEKeZUM
         2rb1AuAURWqTdXeTokfyDbC0yu6UwuLMmUK9cbhv2BQFOAWT7NTO6p2JyypdIqm9Bd14
         sfR/Hc9GAf38g1NF3+nKG68j9Vkcp6WQXWNQt/bcwBknEx7x2rwCHHBg2cUmBazRbl5J
         t/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121986; x=1789726786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=;
        b=bXs8McVkvYonNLc3mTeEh1kEY/c7fbHhPd0UlT/Ts2QRHSkFfUSg61Jw9oPZxs9MIJ
         VMIE8N83xtm4N+TYmPypTRj1qDZ2RYHHms2Oecp3/EQyTtwtlj1DzQSFuaVPvhyg4Y0a
         21s6t1zhIOtMV+XkUERcoe1xPp5bGz2jItmyElk/3XKVipWCwihb8jPWAfDXKvzffy+Y
         EnmVGSiBW3aLqKJ6WkKZgIOXqocLAhqLXtjcAqp3kuITkpdAEeuq2Gf6aKRPsl9Auu/j
         1QSSd+wYvQeDaJzialhGTg9abGwsxED0Ahs+Gb172rBT2lZ1Hp173MpEHOm6s1FILouH
         8N5w==
X-Gm-Message-State: AFuF++nYwdqw3JA8jttOpgKgLgdXxpwZtu50cfuQF7MwNMcByvxthxjX
	KjLNgMb4HIgl47smHVlC4VC9AfaYFWdlU3OgRKwfW06jfi+jXC0gOItEavvYA/vOKu3TOdD9gGK
	+qakgh9S8rpXeSWYl7glOlJS0LT7m4TyV853bfNGjo7pLImT0tqAGtxZSKNBXAmMwTstPCIoK1T
	upiq3q8N1eYQ==
X-Gm-Gg: AYBFou3V8164pdULkL9hIvjICXAtvNejg6181klbM85LgtOzvzsylLq+QOoWDdD7nah
	S0yPBndZSwfrxokLzXi/+wmxeyH3PcCwVrgQnjsGUOWKly0cPfr4OZJ07zWPhVjvMJwaqukgvf+
	yPmPoa9Xm/+BkDNSpaw/raXAdxYp6OttTmzy8dif/VivWV8YTzRiXrGXq1zSiaHnxCDoJpZ/qDK
	RrpNfvgEFDIymzF6nyLVY72SAKVkUSRIKa7/qpIpZbSNzdVm5D7bZb5YuHw+MpcKIumXsPSNNVx
	z9wk9ycRUP0hKoZCYjaU2PSHSi0SBpgWD0ixGj5fWB69Q0RjQLWyz5MuEFOqmGXQZrsLCsVqfS1
	AcRyB2E+VP4Ri5gXSe54z0qI=
X-Received: by 2002:a05:620a:2806:b0:939:6cd9:1fa3 with SMTP id af79cd13be357-939ea0e6c84mr438844685a.4.1789121986334;
        Fri, 11 Sep 2026 03:19:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2806:b0:939:6cd9:1fa3 with SMTP id af79cd13be357-939ea0e6c84mr438839985a.4.1789121985851;
        Fri, 11 Sep 2026 03:19:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:14 +0200
Subject: [PATCH 06/10] arm64: dts: exynos2200-g0s: Re-order properties to
 match coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-6-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vco5czYvy8Dqq8yCRPA7S19Gw3sKCZ5D1fpl0hI6ESk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9Wr3HcGmsAwVxD0+CL0kWH34cqmPGClsJVqn
 IvuKMIV2mOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqwAKCRDBN2bmhouD
 1wU9EACWsjwmfkQv7ieRcIAag7lPpS5DcrTqm4TRiK2v8XxLoZt8D12U6YK+Z+cXJTI0W8QTphY
 czKOWH7V/JYVgmBpA1GP0As60ahUJ09ezo9KINsAwGz1ndkD2OK4vPmSA7hhWNtJQBmFZ6x+O03
 Hf1EZKtee/BrR4uEAxY83KMA8IeEev5sXD95EGdTwj/vsn2C5KfKMIi1zwDI/13mK42lh/KjcLH
 +1zx5UexwYXulkzG3DbQxLC0Bt3A70KKSttynvc/dUiqRYDqipMRYc83xwiQ0FJnEGyBCEM34FX
 OvFJ46MGpWwDVxo2uQAQFoEHOyeNre8nHY0hI8noRC0qJpsGR/4nNehsXPaL80RVSx93c14yAFs
 9mXgFMRrfRkvLBUUSUuF1Rsi8tqoa6Z8f3wtD1ovE0xeVz7gqLqaKWZ3IGP+lNACKsCtFbLjYQ7
 NAfjXPbRPLz/3pWOezTZkP72wHSgzjWuSpRL+Xh7e7iGeSc+OiQmYbG+NlbQjSBpm6CRbCQQ31w
 nwmnKaDaVAkEhvR9u/tZgOJevrFcYMCZUeT17hRQTBKiNYaXuJWvYFSAYR80FT+Qb8VmxdEHmO9
 L/S4sHaQh/Ahbht7OrfrWfE0EGjWQNED0MH2jz8sHGqKUZ3CTRsRREZ0hLtYTSZm9PPEVUpZJmY
 913o/nlTqWv0/xQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3d5c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=webegsIPGkF9SanNryMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: es4Gi6cxQ0mnTDbSFb4svGI35T1SB_Xw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX+jP7pRCBtJaV
 vuMHJxEDNlyqpWwI4k/S4uoz+UWHnUeQQ5TPHWFa/ZIKazIN9LFvvH7gvw55PIB3/RYuieCx6jy
 1ui/YAeJbPvksHE+i4lZGlHUmV6BZsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX8g/wqxP9sfJ/
 KsKWqvW8HeDae0o91/S1+HXGAxdjUKaCY33lICC4kqXkqogxrnnY30tImGwsQtgan8fZQtuCdSo
 17/Lt+7fkmnbn4PcDjgDdVK2E3B0BFH6Qq49ur3Qf+mcNfJCYLB8MggBUYmJ2AUWCYKAs+6Mv5J
 VcFvPKAxHYODtGkQurppMRkTO+AZdk+Pcz+t68ko5JAL8fvDV23TTczog+CI+rBeUuv5R345cTD
 bcgs1xVPBqO/RyILcVimRUgCJHNHiWs/z/HUIzwJwYvxrAl0i3u9pCpDYD+JB+dbW6p7VwgWsC5
 hXeF34hy8+64rrB7HaT/ig/xjzM+QLFFoUDygNyVtYcPjcjtxDnmZMDxydxwI0qeYtZdGLXknYD
 AsNM7tn9aMHNtzo7JmU6JijRPZXR5IKcH9wsL4MZrDM+WTwUK4oBdXgI2l17/ItZIujzrgc33eB
 UU7qAgSrb3tFMrQlUeA==
X-Proofpoint-ORIG-GUID: es4Gi6cxQ0mnTDbSFb4svGI35T1SB_Xw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031948_517895_446E0F7B 
X-CRM114-Status: GOOD (  14.88  )
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

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  exynos2200-g0s.dts:72: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
index 3687bbaadce7..30772bf77252 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -48,9 +48,9 @@ gpio-keys {
 
 		volup-key {
 			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&gpa3 0 GPIO_ACTIVE_LOW>;
 			wakeup-source;
+			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
 
@@ -67,9 +67,9 @@ reg_dummy: regulator-0 {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 
 		cont_splash_mem: framebuffer@f6200000 {
 			reg = <0x0 0xf6200000 0x0 (1080 * 2340 * 4)>;

-- 
2.53.0


