Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04EAF3D5FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=56CjK8Dlmjlu61WmN68lHw5bOAP1Bw9JF0FQpg+rfOw=; b=taPSG9+D6eYwzcJnU6us4/WnnQ
	q15kQoQ3pRI5Hwu/MI6KZ/I2/wq4/Ylz81j0jrX7G9VdhhtXsGx8zz3cPr7jLIDBYl6v3pEeKU6gR
	RXMCOpzerWFTedCgTjySDzqBVEGm67vAhBrdH5eCdf45TObV0VWToVfIifjU3OxVHFLH42DdM5+Eo
	HC9RFPTWUgTxO9RU/rC/C1MjlaiD4bVJGDi8GWN8dXD/kicJYBSQov7lL4nX2Iwh1t1wdnGI1gqzD
	OWggEf3xk6CjF+XcmqxQG9kwjs1BTfgzl4OjRg02TgZD1myxQeyfpw4T098fYai0O9W4x4+oN6nkM
	zxBHLhEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6luM-00000009lPy-1Yah;
	Sun, 29 Mar 2026 08:54:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6luK-00000009lPE-0Ktx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 08:54:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T7SvXH1226669
	for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 08:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=56CjK8Dlmjlu61WmN68lHw5bOAP1Bw9JF0F
	Qpg+rfOw=; b=lwekuy3YcGrbipODntW9V0V3ZbtCSFrBwpaIIz2T8HXUDcZ2sbH
	DfHpsYKzNL62XfZBIu6NZ8XGv07Rrx3IrkUNiVUu4qz+l3KzDYG7VPs/A39h7PUX
	o2ofJShQCEQgb6ya8FlQ5pSgWlXqFxzzaRLMdHWaiFC6OaDPnQdCIpjNXvVDxmqK
	aVGuY69K1B19cAX5xPAp2o9TRgpZoIWgsQ4UTviSVPohr9vSHYP4UsXWrFCkmiFp
	Dq9rot0txpGs+P22/VSjzYEDIKh8iVMMiLHFZ4OblR62AzHS4rUoieDmgK9DmDiv
	KcduodorRYh0JlxewEKCtzGvFscpd2SbO9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672uafcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 08:54:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso48146321cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 01:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774774444; x=1775379244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=56CjK8Dlmjlu61WmN68lHw5bOAP1Bw9JF0FQpg+rfOw=;
        b=RbSlNTktqBbHDJD3xGi7UPgo/XHTparkzGVRl7+kNAAfUUaeF2jRoHuP8/VEDaTdMy
         3mNy8gGSxsDqij4N7nYe5pZHvpFw8YxKXZgnrPAuH3kEvwTQhDKuadgYGLIQYUjNOq7C
         CmjO5TLzZNCyaE8hNMlU8b2zewEylhptT1kdFClUmye2WaEmLx68X36xFZp0EFKLqjsW
         YK489Fsbg1rKi2rQCHiwMdNxQ6IhTMYCOJHLxDYXfgw242bzA2BWPgjw6EnhaAMoeg+A
         YXo0qBfgCvd5evU62W6of383spflobVHKj2LkBZd0TY0fRDXtgXePE5wTQTKs1Kfgv1F
         CzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774774444; x=1775379244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56CjK8Dlmjlu61WmN68lHw5bOAP1Bw9JF0FQpg+rfOw=;
        b=Eq7ECfH+DBCGXiHx6eGN+/kLLiQzZG7z8cD3JpInNs84CXrhxVW9jl/YWgX0uylpC7
         r+ijPljj2Qo34WMVicEjpm8zbDYRtwfdpZoN9mJ+ZE5MAIFFJE2uMPbOI2xQ2bLqOSSM
         b4hgeXGJzwCcFRv3sZ/T6eOfHFPQvJXUqzc0ZK8TohKOs0OYaUmAlqBoMKELrNz1YaAa
         ryGf4npigYIu0pqP+kaNqlbtXmRX29jjF4Er9bE/VqtHXOd5qgRP0TDuDF80wT9Y4fy3
         gLqKo5DkfNcHiNWNKxFPPAE51/9VvUgT+SiQrZ0IRbQYpPiCvnNYu3yHSUhfkDOzY9mZ
         MG0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOqeHR52+RSveUzohqEen1SdaTf2Nv0pKOmsbz6lgZG690DojcJcTWeD5gRaHZxTXW0wRZSs0vy3WGCDuLw/Oy@lists.infradead.org
X-Gm-Message-State: AOJu0YydGdVQEVnd9AEM+GCB6RbXGVIq0DLwRqxKc10vX+peDrpQR7Fw
	f8Oc1FbOEjcrvFIWRYrVI8UzSxs3mMSAfk5Zu3bNWYJ58mk+ghdU4pjAyE9hROK0QVgyPwrX95D
	F6zuCIqp+zN4uG1wvhCjSiLJxNxyXEK9AEowtiOjAm37EdyWjEWg7WWoGPWedRgbJRLV/z90qGs
	eOIQ==
X-Gm-Gg: ATEYQzxF/w3Fq1FgCGe+HzTVLYes2nIG7EHNY1JZG9P/8IOqmGgYtOhffYmgyuRhHdS
	TZF2tpaZdXhcHUswXAup1Z8dyUwIJzF7FedfwAzS4CAYfnF4cD4XQ//JZA6j28Btmw1YJ2jw3QD
	4v+o+oFqQYR/cx45sotdCo6Cw3cw2hJrZgCq6sHNLbIoV5V09eYaFYniNo5C5V/WIonApeEqEbC
	9c6MotkY6XkceeyCo3xNl0RS3PryArli8moNoLVCAMDiJ2PjTRr/I4ziw++yBOuF7LX/GwMeE+z
	jncpeQNvzmZvvn7YmW2JMNg7ouJfmxIGMxu97/cqgfpnCyhWU5k+8rQMOuZeqfDh4l1oYRdqrBL
	M8YkmhoSUVfUPk1prw+UhupgNL5v4KD2t2Wbi
X-Received: by 2002:ac8:7fc9:0:b0:50b:47b0:8138 with SMTP id d75a77b69052e-50ba3808ce1mr122433071cf.3.1774774444139;
        Sun, 29 Mar 2026 01:54:04 -0700 (PDT)
X-Received: by 2002:ac8:7fc9:0:b0:50b:47b0:8138 with SMTP id d75a77b69052e-50ba3808ce1mr122432981cf.3.1774774443736;
        Sun, 29 Mar 2026 01:54:03 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm52017705e9.11.2026.03.29.01.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 01:54:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] arm: mediatek: MAINTAINERS: Include SoC bindings
Date: Sun, 29 Mar 2026 10:53:54 +0200
Message-ID: <20260329085353.8649-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=917; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=uTvVCFYn6ggVdhBFdj3biKma/pt3C7DlTk7Izwkt6jQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpyOiiIrBvn87zGeI4ZNk6E/RKCc7XfMwgS9vAn
 jMMfkmWs3CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacjoogAKCRDBN2bmhouD
 12qYD/4pqcCBzo+fjkGl5/LWnfHTPg4q/79c0QsaeUJzoRNQYizleMmonoS9GrRgtV19ABV83aR
 MsiqCL4pZ/zzPKlIhSHGjpMw/Tze5MME3adwsMEBapto7LMeoTxRdweAn1eb/Yg1moXTMc5xUyA
 vTkST+Pjj5UP22LJtbMgC/i1VwsZzpCI2DdMaW9PWOGv4AXpsO5cBCscq3beTi7fX17WomIp3+0
 6YbNOVPLtqKCmfeTVMIUl2qopnHgOa09WmVRX2pjiH9vEj8ZZLunKB9hXb23npK1Or3rqG3+Pqg
 ZY7aNmP3knlkA9+65qSkdIie9a9EFE8IrfGTOr1/7hQQdiiJqlV0qyltEv9knJHs2/wI5Sy21I5
 6HyCIpZbb2Zs3ewbdQ+eb0xp/Jlaz0pkrfzmj1TASOyfEXZiZHiNYMRZmaAGpYbyUfSDnptshMh
 d/NHsiqHmVZdU+98GCZ9RiX5C7D5Rq+p9uETOvEy7AbS+wAcwWTsoWuaahZgmx3I5t5k0jk8Mwf
 z1vda4tycQSFYIunt+/ba2fMzyGh1yccWcwGqY3zOSFvwqvPRmihQWd/b85cRgWcuYsLJSdBVP0
 Fe3ViNYcd18QwvMcmrgB+5g9+UcJL+ZV3u6feL7q5gTS0NUR9pZboYPdENKbGcC+qD5pdEwgQQl lOnDvUSv1k3Z8RQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WQugBxsP0BtTvll8HFs1V8ViKEsaxwgD
X-Proofpoint-ORIG-GUID: WQugBxsP0BtTvll8HFs1V8ViKEsaxwgD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA2NyBTYWx0ZWRfXxAGflZWl2RXJ
 1BLcMgIoLPN9ZwmH3SprunA6OWAkHiAA9x84wC6kNv5KXHp7LxFqDcOHv5i8iHvbwtX2k0bcpYJ
 qy1QJ32nQh9JBvogmFNfBKmRzHmCzMk/t1R++pCvTbDMtLazHN95WKD+wULw2wvyQlhmTdswS14
 /gzqmhb5wozs/nBN5+mRxY4pIScO4jVSGnSh+ctX/bd3m4fVEugTx5ByzZ39aOD0MZ3GnCLVuoy
 HmeGhnIQ+ikomflhjqTeEMD2ZSSyI4miW2jqSXNF9AipxvTMZS/8LXwcWSIULugciSiKViAGRUn
 aGfISDP5Xw79SZ3a9d9tvDm6TDpNfdDDBcCKX1+4E6fnF9rBw7491rxHGSerfNEVNCItBe5vOmo
 /G9yBlYWp7oy+Tnsvg1eGI+/4EprJEn9iFYHKQGlR5IiLpCe16FmgbdK4eJBYBkTFp0c6OCgW8d
 iUFIkHSYjSaet0t9cZg==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69c8e8ac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=7Ge9OOpH_7tX5qf7V1AA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_015408_232689_C0607A4F 
X-CRM114-Status: GOOD (  13.74  )
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

The ARM/ARM64 Mediatek SoC maintainer entry misses bindings directory
for SoC devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

FYI, there are already patches on the list which used get_maintainers.pl
script and did not CC Mediatek maintainers, so they might get
forgotten/missed.

Changes in v2:
1. Correct f:->F:
2. Cc maintainers...
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 80b9074e96ae..8474210a93b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3061,6 +3061,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	https://mtk.wiki.kernel.org/
 C:	irc://irc.libera.chat/linux-mediatek
+F:	Documentation/devicetree/bindings/soc/mediatek/
 F:	arch/arm/boot/dts/mediatek/
 F:	arch/arm/mach-mediatek/
 F:	arch/arm64/boot/dts/mediatek/
-- 
2.51.0


