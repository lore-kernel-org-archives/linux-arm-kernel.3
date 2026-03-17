Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7F7FD8761
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=; b=iTQeOTzBCCNfTyA5Zd9IA0Ytgy
	IzznSJ2n2leXdteRIctpoO8lgeQz9uhrzu575Zi1bKPM6FQlb7SqRf/ia79B0lJ+R2ccCXVl910VJ
	g8auldN1IaHNYbVmu88aVr1/Kv1+Rk9O7Z29CDudWwtX6ZSqkhutclG/qoqi2KxeUPyDaALykn16e
	1P7ec2pMvKrsE6Jvqd586DF5JIKubVSSq3z4rORQjiBdOMbBadsApfOuyT3DY7KBrMJOd7oRyfWKy
	w4E4qIOttB7AZ+dgix9Ix1l3wJEUm+Cw/JPq35z4/QQJH0Ts+hLeAa2eh+tTPG2fH2dDoGZ84Dip0
	j+NpdrRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfk-00000006JIc-1v34;
	Tue, 17 Mar 2026 12:37:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tff-00000006JCN-1dVt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:37:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8TqNV3295927
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 12:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=; b=FbKAAK1L3AL/kMQL
	f+JgJitK6FzWufXruPRpNmpR/N97YYfGYs+qhXsYzFWU/djN2twZJQc7qjiTnnBu
	qTt5/eNxB3b/2vLfotFc4Y7XuqM4fHblNM4eierINCK1B4jabTQSbKLsrurGjciZ
	7aGfFsUvNSX4w3U09s76lf6h6x0DvWhcuaPILTyPGruHE/f0kP2huBNEhON9uZjj
	gsdq3+4KSJiBHmo+66/zT8vLQqawfThkN3wqsjpcczFuFPKRoNwmgma/E8T0/rAE
	6VSigu2z1dUjkcakUvTmm5MFDPQuW9wFV/GvxZg0QGiyrhCJEYOSIH83YJBphHZm
	ukS20g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy40kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 12:37:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd80c4965aso497214685a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751034; x=1774355834; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=;
        b=jNhSu6mzvbOXL2SRusbEJsHyoGCL+LeMavQr2NMTLkwDkWcHkEGttVw/WfZVBRgljH
         Caq5ARYb5UWs3e6Odv1Kw3IyIOfkFy05iUh5yk5JdVH+DAeTtxS3SALpMU49lB48WnLA
         yAiiympf4NLJ0MhNyleWZQtsSaQcdAyWYCJTt3IpediXUD5SMbp6U3W6pryAdP2rC+Do
         5FV9jk2iQia3Cq8Lj/wFuNPwfYu3F1x8g3QslcOQJ2QEgyJcyXWQkIE4F2pknv4wprec
         OT4uOlGeVRZeDvFvDSF46bsDDIrrD1r6rayzKjmcY1HgoxMI5QMossYMHpAt341z2jWX
         gYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751034; x=1774355834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=;
        b=DKKtYoVjZWFbQxf9wv1fVvyEss6Led3zq7b/BUNHQsMq+nyUnubiVdC2iHivWs0ql2
         UJbSCFj+GfVNHS/rZnYi8J9a6AcSVEC2t8zKxr+z9EOPbeYAwY7s8WfVTflrmzS3wDzO
         1qX2cixnxljjLgwPnJb/wWDixRaBNlDMA5XX2j3nQav1qECj13jSnBu8XEoq8PEy2LYx
         AyitVIjHDKPR2G6oa1Zy6ZxQcz9R2GBaSAVVPXqaDc9u3hgAu5u/oQde4Vcn5rwfi43V
         244LMeVE8j+/C6uLQcSRksE9QI31ImGEKenbzqOPlpM1bENV45SoJyRhNi4i88tBhaTB
         FmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjhSeADpWfsSw8/rWbQ1tVkjTpXaU7+NaCxNXx8AP21b8dLncmHg5DKegkYnEJK1f7m1h3uf2kzx1PmSqfYgcE@lists.infradead.org
X-Gm-Message-State: AOJu0YwxOIAL4Guwu6SSHOpXj5PQhFN40/tVlJvqeur9BL3ydtpayBnn
	PdJDLDH2/vn8YBzs+VE+0C69kwNxNtlKaEcAsmESLdtb3Yi7AtBRMZuEIIz6hkcpQOQAOobh5mC
	ipbJ2h2Z1TFAytngMNb1ZJzi3SdJj3xuN8L21iqararYhGdoRTdP8XXZ/SH8Pug4k8s7dda7PVh
	AqVA==
X-Gm-Gg: ATEYQzzPEp/bX8byfDavFdsW7gHyJrEuvB0RwpUuSh0/+fVQkLtieqXgKtWWF4PnBVN
	pLWfSJp+DENjQ+arKqgsIhNbtrnLq9vyg73JfOv9HjZgTuq7q9ikF+wJ8NQlSY9/g5poxGpSUUH
	717/WPWpg9gB/a9NAeKPQQjHWUslHS3dWGbfN2LLuttVPO5zTaEJt9Q//nv0P1Uh//9y7Xxw922
	7fp0Py2N+3GvEJfLG6BFT35g24WWb5WI8nNSF8CGxvL4U/vsqdcNP1taXQls42dRWxj2eI0xy7Z
	4hJbIRdSsAU/ZBoX2DsUVEkZdL3IAJs1XenQIcb5GkT34MesxgfNhbPjGAOZJRGiBctxBCSShyE
	AoYcZDiUpQVnvwMB+F18ThW6ayX5N2u3pKK7A5ogKN44s
X-Received: by 2002:a05:620a:3710:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cde1313ac7mr379627085a.6.1773751033823;
        Tue, 17 Mar 2026 05:37:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cde1313ac7mr379621885a.6.1773751033207;
        Tue, 17 Mar 2026 05:37:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:54 +0100
Subject: [PATCH v3 5/5] media: platform: mtk-mdp3: Constify buffer passed
 to mdp_vpu_sendmsg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-5-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/LQ5g80XzsL/5CYAV3ISomhAgBWuAHns7jP627oUkDo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrqgmtdERuN3F27OHUmSHYeKw5e7+/d1vJYu
 lQtMLR4gguJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6gAKCRDBN2bmhouD
 15jcD/4/Gi4pOzQo6bWmArEEKAEmKpSLeGaLTVR6yuNG8KwvwphE6E4w2Yi5wy5L4TV30U31R2I
 Cku6v9OjiaWcvGVp2wSSpAkv1HMyqXkUqKM3VHfhP6RHCCNEC8TLnAiGUnDmcYZ5niVVFzVmw8m
 v/1WQa9G1p2v/jzVM3WzKfga6U5SoFezZzU4cWQbM8mJUZUZVMjwaeLqLMyciB80jz8RDRSN24Y
 COQyhl/3m/c1wL8pNJDR8QkNDDJ1GdRmE/ege3JxLwdsVSez4uED0bXNsD53wFk9/9mC5uNOzZy
 3oFPRNIINZbspDiBrcbP8d9229ebKfUr9bndPzjyJbjoLLmHbcmghV90ZlFbO6Gs7b0YxYQW3lK
 VWc1iQJ4PKJ0ocO7WDxrztmD7MIHbH6IepDsz4MPOhFdalKDCrDXa0CfC2bSI1VFGFy2VFAxOBp
 8BGEJmqzGF4zhrXoSPG/6sIoRxAqlGYbCccADWHJClI5JBUqno7bmssBht1lTz7W3+Rs/5ILg1L
 zeQ9pis01EF8YVgyfAXkwrlU+HDue1nOXa21u1ELAm8sWnPWYD9AdR4W4TlYC2aktq5E9xaRTk1
 ZQ0zROlLiome5squwaqzQd3/PTC5FhHbuVFHq1nOwR7UoCDxw1FTX6zYgvjV4ALFXnkbevg3mZC
 Dr9djLjyQVcSO2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b94afa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=lY2TEL3CVMzQJMwj26oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX10hoVOXZM91y
 YZ3ZTRC0+CjPQbzUiLtUvKHQ9fPs8YPn1zSnn2RZvmUoTfdWNUyhnzsv9lthyLGwiBYocD4/1Oi
 nMoQGIxK07iWhOfFej0FT/yeDBUzyl8lOLnGb0fJsLiX9QJN1BbyCs/9p5ALS4DMJv7jmd2JrcE
 XJaUWp5Qoc3pBQ+4MZD4sc/xWKifnyojUZyH8CtnzNaDuS8TOLlbJ6srothw4/wNZyckoP4qkti
 xVXnsQVNfltF0La08/azI4/IoiMgNG2srHq6XdIMT7kpoGjg4l/zLbr6Ql4u7mYc23iWgz3O09y
 fhTBi+w7OVTjsQzqjKDr/DK1YTibPmapcvjiki2bzBNw+S+maXP24kx513zH/DcFHmeIJH+cPBn
 //9cYUEUNYUPUGxVtcKEdw4jaPushPo3iEwcfttJXeUbFt76z6hL6D1wm3DsAVEUmUPQbnbbeDG
 PB2dLAiooEGwh2SW2fw==
X-Proofpoint-ORIG-GUID: o8eDSYGJ5Ot0LK8lyKWLQ0OpoQlZ9hCM
X-Proofpoint-GUID: o8eDSYGJ5Ot0LK8lyKWLQ0OpoQlZ9hCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_053715_559396_95DCA74C 
X-CRM114-Status: GOOD (  16.16  )
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

mdp_vpu_sendmsg() passes the buffer to scp_ipi_send(), which takes now
pointer to const, so adjust this interface as well for increased code
safety and code readability.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index fae3e1ad2df7..67f3001153ae 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -163,7 +163,7 @@ void mdp_vpu_unregister(struct mdp_dev *mdp)
 }
 
 static int mdp_vpu_sendmsg(struct mdp_vpu_dev *vpu, enum scp_ipi_id id,
-			   void *buf, unsigned int len)
+			   const void *buf, unsigned int len)
 {
 	struct mdp_dev *mdp = vpu_to_mdp(vpu);
 	unsigned int t = MDP_VPU_MESSAGE_TIMEOUT;

-- 
2.51.0


