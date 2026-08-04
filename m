Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4843BC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgjGdPbFOrBvAZPDF5UtbgM8THHmRWT3MTZdAtuILgM=; b=07cYGI091VcB9v68cdiEvEtTvN
	LaWpgLT6Iymu382zY+1X7FTcyvLE8yaveu2axelc5Q9jEFHZmiko+AZ/0RNYXOcGldlcx0zIK+BXC
	ASsCoDv/c9DkXfi0NfTK2dCAYAL/PA4bx/mDsZUs5kJnaK2FqJDtINZnjJ8D+2091hO2fX9mADsxl
	CUR2gUD5KBeJhNl6hcPrG7pB6awPRiItVc7HIlZaTnEh5ciaQhtZfCJMenQd0OVcPhd00UVnblBca
	4Jo4JChJjYrv5APT+Weps/pYs6PJbMcAoNbiGX1myjL+GVlBujZjcc1xRVOIwEX/g2IXQUOx+FzOj
	FQpvqe4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Os-00000001Cyi-2umy;
	Tue, 04 Aug 2026 07:17:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Oo-00000001CoC-0h7C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:17:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417nI52283882
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 07:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZgjGdPbFOrBvAZPDF5UtbgM8THHmRWT3MTZdAtuILgM=; b=B/qkmK9YpbI9Be+Q
	02N1LubvoXLC2uEtUkGyCiG+yCpRwKjhtJNMz3gyk4SRfdE9Pgl30plIQcTvaCeH
	WgcLCHFvtq3TWA04EzutdM9v/k6BrkpEdWvpHxdyMkqOdbp2zpYnb5jNheC2wulR
	2cxw/mDbI6kPLXFO+P98Ys/eQiGEXMPCE8fL+Fg66p9cvIIOQ1CT1h3cgC8s5dSv
	E4uCR2Jn++QaKJO5OfGklGmtoMYNNIuCl/ZtncOGgvXLG8sejVnO6PvNi87AT9QS
	jz02JgV/3chXPHjQZhrwyjg1aQy7v0YeZgrUN+G/QT9yXVMsm0nFAnGbe2PVZFWd
	p6oEOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu5hqsd4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 07:17:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso9439191cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827836; x=1786432636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgjGdPbFOrBvAZPDF5UtbgM8THHmRWT3MTZdAtuILgM=;
        b=ZqayP/AhO/pkWqGfisGqNOiZNTqt35nS539/ORleTpqCfEGXrci4imopRZ+1iPKJZT
         ckXERdLAjlISHv2IrxVrvrDYMtatpTo6MVYJFJODg5c8dD4grPxynAT7yaRXU+DRE5Rx
         nRo9lcWg73l+lwT6Lfi+JwPgR8nplp+v+nDwamzmx0pnkU0fsW4k1A9Nfwc7mqGn8+03
         jxIs+Q0hSIh10t0Ll1iN013xrSBXb1eBDm9TjsbDJ2lKEOPr4b2AMuYH0KmKjmvh/JmQ
         EfwX7D01QOHllf1tT/pglKu9g+meRrK1/HQrjHNaIiudWcPzkhuYZzufPSjlAIDYBgjO
         NZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827836; x=1786432636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgjGdPbFOrBvAZPDF5UtbgM8THHmRWT3MTZdAtuILgM=;
        b=G9VaBLYY77iSL4X/ZZ3LolEjPLyDH2hAUjKNYyKL7fHZUQLsgStftgCgfSPVedPjtB
         gSfUoJhpIf2H1N2fSkjAPSZGWluZFkg+sR0acjReJz4aSjd7az7mu72lbu8M3DSkDAeg
         +TvFHEDlJQFJOkW9+ZakeNEhVGIrKejiynVonfZhqrhDp1Ala1M3oDDMojA0Wmru/E2W
         oDESnPWj8P6rLDEDPo53N6savXzypM75Zox3ff/wGZqIlBpnS4S1Xbx58EGwr1JAGCr3
         HHUvKog3e5P6q0LYgWV74ImKrwyxemCfelmK80zC4M35ZbOJLaHuv9KeDFv1lUFeH3ot
         ccMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMeEUr8TUlt1IH3qZFZbnlIO3Cz3rezv8WtbEK5ZXgfF+5pY3KvVhznqtDKokQVcFW7TRoydHEOrIHBCJG7Aqs@lists.infradead.org
X-Gm-Message-State: AOJu0YxmnYi9KSyTW+ogVqNCc1U8rq2Bbq5Kbw+2eXk7qCSfobtU5S3A
	y/NBAf/HTAY7P16EFPKG6tc5IsNvzDkQwkuQ5MYrVIuoNR7RqFCpWCmk48WIfUDOZIVNeOf++xf
	/1IKZ/4YhDo3hnYba4OuFYm5O1Gb4E7ZuFir0YbJVaNGisxU45fMc4F8ADIVaCWJkYlusHaAgw6
	5GEQ==
X-Gm-Gg: AR+sD10Seub8ks3I2wWhs4RnubIQ/QXVH8bxMwfPUF3jMFqkAgT2Y1wAITctzGiW2bY
	k7sbhHR/mNAGCO235fYthOIM8xxxLfsskBW8Cl36LzpJxnXxcn0Lc1Vcwqm5T9V1XGyF+zh/34Q
	ob5jlMRa4GYrOsbBW5HD/EIok9m2nb1ATw13N8d2We2vthZSRM9o/9v33olKAdMqogWWmeu9Esv
	tbCmYmBKs2aQDge4JYizgpaSZLKMWcACtAmjwv6YcZB4QWb0M4uX0CQ91frTOOFZnkeVI6Bhf8y
	lTj3/F867ycQcAdNV5I00RkO0k8x21TIu5z7uFD8RQ5gOQAu/k3P5xal3AGK2eNO4XTmEEoCOqZ
	2ClDThKbi32l+zpJOiAWEQWRi
X-Received: by 2002:ac8:5802:0:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-52cd353fcbamr43688621cf.12.1785827836484;
        Tue, 04 Aug 2026 00:17:16 -0700 (PDT)
X-Received: by 2002:ac8:5802:0:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-52cd353fcbamr43688401cf.12.1785827836136;
        Tue, 04 Aug 2026 00:17:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm420265975e9.3.2026.08.04.00.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:17:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 09:17:00 +0200
Subject: [PATCH 4/5] spi: dt-bindings: spi-cadence: Drop duplicated
 type/ref
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-spi-num-cs-v1-4-4ccb13dcc7b0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QvBv95KSm8SL2goH2K3maE3l+qVg2d99K5h/49887Yc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcZHuZRAX5vP43ZFkZZlLQewkCV42WR6ypgeVN
 GNZxrY2XoiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanGR7gAKCRDBN2bmhouD
 178iD/9bjlLQN7VCREG9hHKpqvo7x0FpdQs/jSs5UwEx86EVo85cZ3LN4KF1IhphaMVqqB9BrUG
 rx+yz8Fjvy8HFIRc5SlRwaqojtiPkH6/HsLiKu1jDMDWZQvSnWG1+KCTbfPef9yPYkjQ9BLkW5s
 76VfxpaM10lL8JqXplJu+iqGcLGwJ/tkNXixYW9awi16t6AARc4ONZDUTy/FXC6+/itUEqNH9aq
 22XbFTNflcyhQi+NeSFJYGMmzVnrrp1JOgwZtjlkagUVHkDLdq5YI36JkkDVWQqb+f60qel3ts2
 98uaMfZfsQnVi1ujKZidhdiWQaidB+zbMsAuiRmxZZ7YAcrwbLh0dYRmQ8HTMwDDMp1r8+yWp5h
 D7u31IEPja3WLrKjfaqnJmOqLMcokK3O8gevh8KxgJQARzoPlFeNTMxg8Wu3b7arl/gFu2p7hwP
 mAAkGbO2lC9AO7A1wqGGPYIORqeawEESTMw/9QTy9w9wujjiGl3zIyS5wUfkWxsKK+dYqwjfj97
 FCxKc/pKlPn2NTUGsE9SZXxtYBqqUsFP1acOCVDSgRHKhCD+HLuMJ34mmyrh3FNZJqjT3jT+STu
 5H7G18cmshN2t6eL5YicM8oReh9zYzsnpSSHGlOrHkfCWcPjzirRt8CxUybg6qmx+i8J16x7RBr
 v4f67HAw2yTC8hQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfXxP57hQiW4w53
 gA13qOdBrX1DIKxl4dbfzoFsUiW35rzkQe5J7wWUJYL7fW6s82U2wCF9zslUk8Y0T3Zf4cMaNG9
 Z3K7r0RlI1w+hCBQtwJ/zWwsPXGFDds=
X-Proofpoint-GUID: ajKIRFzufx_Nc-AipOZFkUd4XsvSAmD1
X-Proofpoint-ORIG-GUID: ajKIRFzufx_Nc-AipOZFkUd4XsvSAmD1
X-Authority-Analysis: v=2.4 cv=EoniaycA c=1 sm=1 tr=0 ts=6a7191fd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tRHPAiqlqGnVGwjNgokA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX1Dc6JjPz67jE
 8+Ww/mri0Jkj8IGsD3d42rDQa8WmVLUQMwo3cbIc5709+IxJcSn/hKoRjTP7jhozc+K990FIIm1
 ODn1CpRsZktv+iypzaY1pEB5QC+jmCQBqfswh16UjMDWmSL5A38sHREsh9pr+kC/1Pimvmz30eE
 yjc1m69rbvK6xx4Z3P2c38ayxJRe7fsPuej1A6JWHy7d7Moh+hw8bzRy0F4MSUrHIVYHqstfKVf
 owJWp7vGqoRVEeVdguijRyC6ykXK7Qgt1OW4jPZZ+HgsfyOl+moJ3EcDsUaBGWOAvK+z823cWcC
 yB5PbBEI8bnpyMLeZjb9AXQv2ny8faR+WXvPOlSiuoPtbe7koId8Oaib/YVUdzhrAcUQ7aLl/v6
 cS8gI7g38vKJYo+/Pzk70VmT3ZpIrY5yltJ+635FzbTuQvmZCs6bgFlKbZPzpCvbzMPTCuYngTz
 NkkbYlUJ1OLA3PI9XkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001718_349261_D4E265AA 
X-CRM114-Status: GOOD (  13.78  )
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

spi-controller.yaml schema already defines this $ref for this property,
so binding does not have to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/spi-cadence.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-cadence.yaml b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
index 347bed0c4956..429cd824156c 100644
--- a/Documentation/devicetree/bindings/spi/spi-cadence.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
@@ -43,7 +43,6 @@ properties:
       Number of chip selects used. If a decoder is used,
       this will be the number of chip selects after the
       decoder.
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1
     maximum: 4
     default: 4

-- 
2.53.0


