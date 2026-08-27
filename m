Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC24C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=bM/iRQF6uJw+rtC2Vr86KcrRhl
	0kPkA1qb6QpItDyb87BLF03P7AFxJ3lOnS8hkr4WXf/y4p6/T/5nOpY2qOXtmOefebOPuFm0Yy/kp
	427VXKkkhLDP7k3Rlo9cPwukkEwDbe5pPCfbsGx9RyRh9z8XvsptOK4AVQ/RuAyqZmm43gp14Lt/3
	XLnYICq4M7NRo78brsHJ4OBMrF1N8SYwQPa4IpSgUImyYdHWfAKFZSYDYaoZFNq7yRSFJB90QKprV
	Q8J4eHpUNop89Oji7V2BZ4j84x65IBO1rUYsjumuHFqFx7pAPWVqVnKHIbAxNs/liX1MsKQSbGPSH
	zNWKG3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGm-00000004VSk-2Bo6;
	Thu, 27 Aug 2026 17:52:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGX-00000004VMv-2DA4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:52:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXhRo000656
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=OrkbTqbqWLWzXeag
	Y6XXLkqEaCKKrZXZSJD6fFjtW+arBtUSejC8LlmqYkZGo1Frz97/GS1qSFnEmtLp
	YhrS3g+zXKYkgfs1iz7sBl3HodoWvnfSxpf3d3QydT3ID2gs/poLNXfgasgEgg10
	t+YK2IuDEzUmvUKW9QjXGbXwuvWLH3IeXv99ppVoX0J2C2ppS54vIS3+q3ZdVudY
	m0SKc4O5tMYH8nOyLYvthdbfXn9AbPA1yXp2B+SjKwFpFdAi0xOGqA3yl5XOTNYx
	Ci3O4TFE+r8M9WC7Ms4Byt5ElEsXMDCIoIeBuEyNX788p2kTP1/3bvUN36Zvjosg
	JgAG6g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga6etvsg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:51:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso1731995ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853112; x=1788457912; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=Tih15Ki57NES9SlyHXrIpa7lrGt2lSG7Uc7v3IPLGH9Q5imUaia4StXyYQ/yS0Uku/
         lkl5iDYbUY9Tt6lE9A+vJxJYmiYIFGIdnrtFlEoKJ1TE8kcqlyjtfWwY0pSSiiGZynxZ
         hD7mpx1TtM+LbCHmdPGNNvD/y6LrfjH8ozNx3KrkNJcY8cJVPT/ygoeciraIDpaJTOQk
         87b7u3cEXbBKiPzlHTAnyssEl6P1HLT07Hnrm3LEfYxA01MB/bN+cxbFuCbtefjdVzG1
         mMbJlSxh7FrOJntiS+h18YAP9EU1m+Y05ArlSz2aAC5NWPcURIGi7X8GUWLOGLGjcoly
         dZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853112; x=1788457912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=qRf8tPf95/7kfeYjoLZBClLyWpaz5BjbpmjDExJnuTHuQHqwc0yELND5HWl4Sp6lze
         +CND9thtByAzFxHWI5pIO5CuBTcpM2migvgRdiOXV4uaM96yRFGaPrssE9IGc2ibbBQ4
         5m7cMISzTz2blkXFgDXKsjYIFvTVsbTs+tcBa42oDnZ7MAFgtQXA/RrXZO1/QBoZGHCK
         11TxPmm8ktW1ssLbmrPxMFRnW3ISUCeyPi0IhFXZGCil7Nr2injIvX6Quqit4V6IqCEc
         Tzd6a2dL4XQHgunyQh5GlL3unBzCY6/k503Y4e63cA8LCV5QVfHJ2CyFl0QrcFxhpBaN
         Y4tw==
X-Forwarded-Encrypted: i=1; AHgh+RqB1LXWL3NQlknUh6nkdeaE8LlRXDW4MMGTECpQtF91XGgDLyIobLpSNGkOCSGBOXmLNIxgWt7SubYmWtIx58x/@lists.infradead.org
X-Gm-Message-State: AFuF++kHhcg/L+DtakxHDHcjPIIWVKIiPJfIJvr8IH6mCphMIk5jof7Y
	EFBIrTE8on47P2usxLxnINWiMQW9JYN08OZlv4XL+S2ZKKQDjXEYt0BKqqf/nNQ2kChH2LdNwfB
	PcSXHPQcYinknmbVOxSXuz32UMWY3uAHpUxApIrel1FcL9KcyOPTAV3A0w5pfC66sVcF+QiRihe
	Srcw==
X-Gm-Gg: AR+sD13rIpLdeBLqYop+JhvPR9y6PuaRewhcjrvhPJgFpWDXTClVhQ9jjGB96t6VhYo
	XX5heBsPHnTXmAruAPEq2RbUIYRgwXqAo2PW0kOENrMXRlW/jhHxu+7MeaeReQm6T9Dc0lTozJS
	YlG1kjcLYFNBiMu9lFB1oSoXGvXwjJj2qyz9Sh6A9YCWsJPXiGUz6eaGLKRjzyEtkY4JOQDc5nA
	CE+a3ylsNaLA3jf4z/KAzY/zSdjDBcl8vYKU6hFvd2EtKOwBJeDNDx5KBQf3WN9wKyC4/kM5xu/
	cGnRMIAgbXrlIr3xFO0vejMcRXp7dcntyGWk3Sp8OFKuE4m3VKKdSy/TWdNveh5EjCcgtevJQVD
	fLw6HnMx5vN5AYvzcpVNZD9JY7AiQm0ej2ZvgnvDeC/oc2JBjQStBDJl2Qm32h9ubvAlMuxvsb5
	OaKJtuQ6jmqLQ+B8qrCH0K16k=
X-Received: by 2002:a17:902:d588:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d74dbe40e6mr13925315ad.2.1787853112448;
        Thu, 27 Aug 2026 10:51:52 -0700 (PDT)
X-Received: by 2002:a17:902:d588:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d74dbe40e6mr13924515ad.2.1787853112019;
        Thu, 27 Aug 2026 10:51:52 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:51 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:07 +0530
Subject: [PATCH v5 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-4-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=902;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
 b=624VoE6RT/CK7yFN44c4vo43lHBpjAc7wHgne3hVVyn8wYeeopVl6LTMwJWZJuoDMQFApxSf7
 MCtWLZ/tVAvDZQGkWqsNg8O2BvuWsSs/K3ckjUs5KoziGaqjuojV5us
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a907939 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: pR7UXv7HkwHOS0kDMQw9S2Uvv2l9Xv-R
X-Proofpoint-GUID: pR7UXv7HkwHOS0kDMQw9S2Uvv2l9Xv-R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX5ewMRk2ET7o6
 Iow15F4IdxeGH0h0ZYwkS5HqhQSnbd17qzVTiOINo8MCnd6Iwo0LNqzM/6gKBI5273gY3qAOFTr
 W4e7n27W+lsRsbP7T9Uis/S4SP1Y9V//KCldfnCagedme5AbbdStlz33qn1jtHhDl0noLhueL19
 Fte04klXFPzuXCaG2WhXgqfC1WLgQ6DSKpKcEu/bY6mfCwyyMqB7NfjcwwFhYI+d0gVNsCpsZqm
 GwlqDyHjso9C+w/TSKrGpChVHOuKbnZzNrXsWlWWoWzQFvm67S01TmIrYnrmXsjagW2I3B/qN7y
 595f+tVVU9xGwPrDjKjfgFced+FTnZtdVN7ClH7pBvpPQpeNMCcj2xh0x/1rTt67jy0f+2QXJgr
 Trs2+vCuYvb5KQTOzJVXUZhBVpHqPRZywNhylEpJVqFbIYoV3376suy8vokN2rxKcFQIC+y9NAl
 djRSBbUGfQSUmYUrOXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXz6Miv4f3UnlE
 EYcqOtoQmFDzTCa1uBgBllEd8Z/8Ik12gnWdX8tfQyYEyCTpO1CdiBTB8sYyF1L6SnM4ECziYGy
 k2J6opxBHxtQFQyQQ7jUUqdAyLuyb1M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105201_929271_50395C2B 
X-CRM114-Status: GOOD (  11.35  )
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

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0


