Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDE5C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWy3QRbfgpiZXVTXkRg/bCJ1Xd5zKfwmvVKRPIl2Y/Y=; b=jFOe0i6NjPzp0lmOFx/MrvaB1V
	UssT2B3stJy1Z4+idMrbumtHRqpVcamLYYNfC07fCxQA0MC2mCZNOnOvp5sYwAqEDqoUdcz7DHqqB
	BIn4a1sfXnhWO8XCqcd09P0B9UD8Ah7pKYfXDJzVM4q4Uj6jY2eUPCPjB42+O+8/BnKh7vEi1H3Q8
	BEtZhKtsXCBjDNkQwFhk89cYLhBhsIq3ystlV1c7TvbxlalZu1bo3QFX9FXOPfOWA2nbjTw8xWpHm
	CKW5MgaPlkXQ7DGWUW+jO9+ywI6GNnslcb4A/Is6Cn+Pa9GG6M4r5gPhYEaWBjZuxstqEYftWgbyV
	KDXdGGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Oj-00000001Cja-3dh2;
	Tue, 04 Aug 2026 07:17:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Oh-00000001Cgx-1aVy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:17:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417RL71670145
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 07:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWy3QRbfgpiZXVTXkRg/bCJ1Xd5zKfwmvVKRPIl2Y/Y=; b=hFB7whlbLUFMu0+s
	MXOXwWacrqSJgEiDAFDirLrNXA5m4FoPWUZlFd6A4k38CV8tmQxbcGyzBlY0Du1n
	wNpKUpF7ZPVWlwQ6xlV9JY0QvY4MIse5oFkIrO2Q9dDhqY12iV7j/QY724mJKnW+
	of3zNPExayhKcL+urVogrUllh/RwC7D1FCX8tt95SRiCbuzLnB5qUT8YmaAofxNu
	5tl9puOk1Wx6m/gm1D6+6+yzFZhc4I0KNclz+Co4VCrWWEPHgKqxvp1P35jXzHQr
	6YMUqIstLvyTYAX6p+m+6ppwC9eGOnKxoV+Xc7cPxbNf6HGW1an7H529udyzZYKH
	URxbJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftx7m3cy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 07:17:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso40397351cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827830; x=1786432630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWy3QRbfgpiZXVTXkRg/bCJ1Xd5zKfwmvVKRPIl2Y/Y=;
        b=K7yNBpl91crQvuKIQhsKHre8bhm3bRXYE7I1HSn6zYGxembnPVcvdzEuiBgOVKTPxl
         HSlPqjeTZAtJkO0Gp3qHtAt0OZgeW0s8QxX6a0MIXmww860ZvRMXt8A3qvxf5KKl9IvL
         ramABK8vn3Uipjr7uaVNEVVSVjV2HGRf5v0MFkKkYBmSpsw9of86bDvAXLcFghrh6kWm
         hvyZIrnvJZvl74VOTPGFPXcUoh/qr3F6fwGlJlaR5a4KK+xjsKBg/zZkNeKrnyQ6pX/u
         AXRDuXGk99D3oJyv1MbFcXeUsvQc6LmfwRv05KwIRtAnzYWGJF2THlE25jTKIfCuioxa
         dDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827830; x=1786432630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWy3QRbfgpiZXVTXkRg/bCJ1Xd5zKfwmvVKRPIl2Y/Y=;
        b=nU+h+VaCdJNS7pKJrMyYcWgEs1tRTGSq1+z5ZQnBOyc9Kj0P5n73iqRKH5+zF0mnHG
         DqZ9vvxgAZimOVhmRi0B7eYuTLOWvSLRvDIPGjNOeM38VygpX7Skg7B/O0TusRX6kQOy
         aDUkLRWyU/VLesAoezbjeOU/EWJFzgzlIeZYL/lXwc7iRwdYkhwuso6OQ+BLXqPLBRBv
         pni4VNQheLHnfE0UifqD83Azsou+g2g9+9SENgSLuKR5+rjqWy7raWDlFTYsAMGguWYk
         WiUdvYgcdSs9d4KTXlyhsz7CkBQ2L7i9WahJJ+vvCr2OJO8qt1rehyEbiFQhJ+Ta7LU5
         HAxg==
X-Forwarded-Encrypted: i=1; AHgh+RrinQF01G+Jek2cwfLngQUVwo701cEv7iHlD+zPSDNdxgwhUPFzJ9okqde99QxzP1gYYWpYm/nPN5aK0wlzlpUt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7HhqzgckFFtEHMaDCup38BZbaaoLmSsxCdMwExiCtpNlIhV4K
	elvzoaScS6+ofBpLIXloMlsvBzQhNgWM+tU6ou81jbxTdAH9XPP9FRc1Dd9fe4RmXT94IcO+MHI
	1NJeQkwD4p8D8K1X7HZdXGvduW6shupY+hgwdZ8zczoGvfRnE9nbGpyYfUWLslIj9f3BM/CEIF1
	G42w==
X-Gm-Gg: AR+sD10teUQn1pQJMTNRUMF62Z3y0GDtAYT/EagpWJOZu3kNLiyftC93gmE1/886MFM
	m197yVu/3t1Kqkosg2shvYRqLNOaf+ubrU3d8bXo6S6PhAIG20OYlGvB7PowndveoKyjG8Pycz0
	CpoVVq2xg3Kj3P0sfz6DSOmLzvIQu89cRN1jauo7UwmnfwsGW2rzy/yrassSQHfDeBf9EQ30ulE
	fArOjbLwNTHkadyfqheTD3DlHwGZdy6eSBx8VX/UDNoFB6jPd+0Oc6/9Hd9zC0m7+XYsvO2jBBw
	sz2HQML6aDTxzDSQ+glxR5ASVfbb/rSY5khEbrRZJIwd6gQJHXkzZVwzD0uve7kfKeSRS0ur97r
	qjR+LKxk11swCgkSMTlr/JkHQ
X-Received: by 2002:a05:622a:1353:b0:51b:fc67:c738 with SMTP id d75a77b69052e-52b56791b53mr239342961cf.29.1785827829783;
        Tue, 04 Aug 2026 00:17:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:51b:fc67:c738 with SMTP id d75a77b69052e-52b56791b53mr239342701cf.29.1785827829337;
        Tue, 04 Aug 2026 00:17:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm420265975e9.3.2026.08.04.00.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:17:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 09:16:57 +0200
Subject: [PATCH 1/5] spi: dt-bindings: andestech,ae350-spi: Drop redundant
 num-cs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-spi-num-cs-v1-1-4ccb13dcc7b0@oss.qualcomm.com>
References: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
In-Reply-To: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
To: CL Wang <cl634@andestech.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kousik Sanagavarapu <five231003@gmail.com>,
        Vladimir Moravcevic <vmoravcevic@axiado.com>,
        Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        Karthikeyan Mitran <kmitran@axiado.com>,
        Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ad527kb12Z3lZcLhuWdL7Jn+p0bLRdofVSznveAon/k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcZHr/blxIVnjr0AiiUy5E/egu7DjbnwX90RrC
 IRNXRfLF3yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanGR6wAKCRDBN2bmhouD
 1/daD/wNVg9Q40+3KaYuIMq/uBIFIRh9d53piPOqtUbbmQ/b/woxP2rTZx0impr9LnPWn/nS5Pn
 mbGwnLiIDX6uN5iz3i/bzA6I0Kzfp3L4JqlTQamDg1PCWNqsCgmLlcq2eDVTA5m0BDrI+IQBL0Z
 CMoV08s669J1xnkYmb4gKZYc7qeB2vvpnWlEacJye1np/WwB2iqato4WtO61xceFUa7OuqSK+C/
 8NZ/6+i5K+UAxpkClM9IShKE1OXkgi1IKfiUbdz0KnzmcdxEgyyUaSQkm5P4PrNoLc3YObvfi4G
 NGAwqjmW1acNAoLza6JjQmO6q8ll5TdHkKK1bVoQwl86PGzT4NJxatE275U/k2j8DgGugC6jfLg
 pAPD5C1Vwp8OBHRlM8HQbJ9Cg3G/LVYc/uxeUorVnMy06Fe/aDV9XYzDZlstArUZlqENknfHMJM
 Xr3JN5BKeGF4eyPG5n9LPVcRo8lO0CzGVb9TvIE1ZBypo2kOsfW8b0gH7CCaSbJdtUL/ZE7S53K
 zp1A5E5uAfHxNlpjkEDlN9EYPYi4YJsej4elBB8b8fkfFZ71zYjU/TGraVa/TPAW/jn4LdIXfs9
 1TXL2ttx1Nk7/ltOYChjDnn3Z+LK/jSeFRUwcrd96pai4vlJHiPBR8VL29H903zbdPKkOmr4QpM
 /Bwp8ME87xXaMKQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfXzemm8J0OM4PV
 YBR+cZvnH92p9iG/orNGa6Cz2MkXAxuYWauH4LqFXd1v9aotR2g7eRggc4mLioSo4mFo4f/iqtI
 ArMEMtP4wF/NMYwaZE8GIBnsFNkZWWWb7XzS825+KHqfcW8KTLA3+gLuCwUcgnlp9eWhQmgTVa/
 eROpu5CRjE+mJMLw5/WBy5qddtihE/4ale8Cog5Ju7eX33npnQbLuEeLj/xiTwoJbGKlIelJwAH
 IcxwnNNC4pmHsu88q1ZGQ71D+7Q2QtfZjmRdMJoYPwq/rKqguVACOMpKC3P0gut4+4rxcs0oj6A
 zFfRwqIrMcF0KDjzWkrUAN6sMo1x+PCf4GzgqsPdo3S2jZBAjo5njb6ayVlI4K64NMKNoXqgYTq
 puX8YXZoARg2qqFkyOGiwB/PFTI5w85GmV44UcSxRB4BncDTEo9S9fFn3WFiJm3BwKWCZzpvhJd
 /p+Go9MgjVi74FfdiAg==
X-Authority-Analysis: v=2.4 cv=TIt1jVla c=1 sm=1 tr=0 ts=6a7191f6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qilZQbzIvi1Av5Pd9fEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: P2C3rqu7z6yJKcklhsW7bE26wCpECo__
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX+ce88b+yliGb
 kRmXL7rQdWKrX4nZ/1tTiRhuxNZvDBp8g+Hp5Jf3AQFwFvbvTHFGzk21o9dTQmi4l6lfkTIsbzx
 A2KQ6s+pqpdCpJLB9Xy4KU0BfVOWn8M=
X-Proofpoint-GUID: P2C3rqu7z6yJKcklhsW7bE26wCpECo__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001711_437629_7C171D87 
X-CRM114-Status: GOOD (  14.63  )
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

'num-cs' property is a single integer, thus the binding should not set
maxItems.  This could be replaced with proper min/max constraints for
values, except that hardware (as expressed in driver) supports only one
native chipselect, thus constraint of "const:1" would make the property
implied by the compatible.  spi-controller.yaml schema already defines
this property, so its presence here is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/andestech,ae350-spi.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/andestech,ae350-spi.yaml b/Documentation/devicetree/bindings/spi/andestech,ae350-spi.yaml
index 8e441742cee6..381042e07fd0 100644
--- a/Documentation/devicetree/bindings/spi/andestech,ae350-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/andestech,ae350-spi.yaml
@@ -24,10 +24,6 @@ properties:
   clocks:
     maxItems: 1
 
-  num-cs:
-    description: Number of chip selects supported
-    maxItems: 1
-
   dmas:
     items:
       - description: Transmit FIFO DMA channel

-- 
2.53.0


