Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D59D7497E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K0JIeF4k33yI3s7+w9je79opOs88ZXUfAhVsYJKG2Bs=; b=bPb0srp46nX5aN
	WtIqCk22Uq9XQ/DcLLuMG9oOKUMvWd7svTXDTtQAxZxtnlV0WOSw2E/WP45DqR1vKPNWHg0RsHgID
	7OB4AhvB3yGjUYPRVId1gUQmyjn3nISdRAV+MsnnfZEo/ecZ+CrkEqesyYDx7DGfdi0vT/5zs4qQ4
	SlgcpvKHL5BR1jMmQe4cITZ6tVWKNFRRscvn4GLLl3HZytb6HXa64RfieWtEJnqr1yCw4wXdl3U3O
	TR2R5J8JFUEqbVH8qyS8nNf/i9R4O3dP30YinzbA0B/tSutw7K30dCoQL1MKH/8jRt08kRKXoPp+I
	tR1md+teAQRXqHupqXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXT1-0000000A2aE-3PFx;
	Fri, 19 Dec 2025 10:12:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXSy-0000000A2YV-1Z7O
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 10:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=K0JIeF4k33yI3s7+w9je79opOs88ZXUfAhVsYJKG2Bs=; b=eu3PdnURvr16egF6CVTL3pXkuj
	uOUACcykF694JbBIko8Dp7YJsCku+ryRN76WG45J7Y38zdeO51NyD0F9virdJFvglH9F5/mGDYDfq
	DA5ZmBTRRMPsw2OanvnVHgvlzmSY2GIKb0s6/qp0OrIDReBWiQzMDJe3iLwWn1WPteKXN1pi9Ag53
	zdetNo+HAgRvEmwfg+H4ByDY4v60cJIuz+VT5IvzkhHdvyxxo2fUa5jsXnFUoBRKLiItncS3XQwre
	01wGJRoMVLWfZ34M5UDYYu5uA+l/Kw4kJmRhdsyjghnl3Cck/yxQTtUE9v8ANCJPqO/NLc/VAuQtV
	QmQNE7vQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWbS-0000000AYcx-3crh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:16:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cA4w3319088
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K0JIeF4k33yI3s7+w9je79
	opOs88ZXUfAhVsYJKG2Bs=; b=HMheFPC7ELF2bkYkX4Xae+GU2O8Z3G7geqAIAd
	q9zPbeCEBbJAU6rhixZDYKR/1BTLvK9pbXhckUlZvqO4yn5yJ46jBQz+c811k6xx
	YslPFRLtjhMjElfGfClz/GorGQBEZza644n2wMe+izoGX4jOIgQC1NSfbR9Iexex
	GhY5srjIRGQVuzs2Bm9c1XOTpw72IhOklLIrdqzmnaq7TOKWGbTF8UHfivSLTlwi
	VF3J94Ku6gHOiBnS1v8b8es6Ui72M5fWjLSPn64mNzryt08xrbKsYrPW5y3/L5hg
	cxgavzAR2a+3e5+x9WPEBIckCF7dQvieODW0jGUe2c4oxozQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2et7qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:12:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee16731ceaso29473851cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766139120; x=1766743920; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K0JIeF4k33yI3s7+w9je79opOs88ZXUfAhVsYJKG2Bs=;
        b=dygAgrgGnYCyiCzrGv8BbQ/MyTaa4LShacZYTjFMt0gmpuuz/RyLBAIEijC6k3zsSI
         reMYf3L5JTWg7OhbtX/439ccK3KoD68Kcajrfrki+NPT4Ic0pTDH7U5+wJ/2R9J91EiR
         eehiE0oRooJcinc4yRfea0Ar/alpeiQ83TuEclRjMJAq9SQ07ttlfNOm2lyhX5/Bedvv
         ZYpbJWP4i+Jo74qgpwJXBKgffAOgM5o57/h1o+70j9DanK2tcA3GqiilD6VovwiZd8OP
         T+vl3OjwADKrvEcCr6OS3sN1ji0EvN4S2QAmVNr8leo+QsrvamFmBVsJsOQAPnEAZ+C9
         sD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139120; x=1766743920;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0JIeF4k33yI3s7+w9je79opOs88ZXUfAhVsYJKG2Bs=;
        b=cFAe5IYRGiynp3TGrmUuS6t3fZFUyJpwpSaPRaXOV0aeZNvlbtUj5MA1uecktjvJr4
         OA2nUchWJprc+q6885eY5J10nnQ/k2JfX6gyazJ7oxiV2LzhnWQMkC0G3wAx8LAGcmtl
         RRVEzU6YGWjDzaHaoO8dJFA8vTfpfxDoSJPXpWLpu+W425hmxITy5S/NmHjXZ8QQE9i9
         MdWs0ONHaQ715l0GM+DAXtIqlKD/NLmQM3bCLYiZaAnOIRGMBxrpkttP9UJlTTUOznOr
         qvLXNWPgXXxbBNmfiO4HRnaDeo6eH5J2C/n4licscMgHGuBtMzvOiOzXty1mpO7n7sd8
         Xeeg==
X-Forwarded-Encrypted: i=1; AJvYcCXNwdo0l1/3WaX/l/AXWjtWAsae9AQi/tPh7zJ/2YZav8LQLBin8BLc473yH5UaNtc/sUhfbf2/aOfD7bYZnf9u@lists.infradead.org
X-Gm-Message-State: AOJu0YwDExO8jXOai7o+DyNs9AmpGWwW/4Xrxe0YIzvlsAUKxFlT/O7g
	Z3QMwWoCkP9WiLl1JWnb2mAOJcfKO7OAK/qjj1MljOCPb6cFmpK6kHiqYDwVOnvK8AQ7kCt0MUR
	MOd6wG2jlZAn7avZPHxR5a2smkBopTxQlN29WM0o/44XwwDqH9sqchhphgGyl3jdiEDrD2J5Zvc
	a7dg==
X-Gm-Gg: AY/fxX4rU4Tse0lpgMx0iFpiKEsC8RIVmgVXzDR263wWPsYSlqsRbYZrg2r5x3vmxdm
	mcrRv7vadh/y5u3uLNQaMw9uJdlpFlehxysMpQ5q4IEqV3tr0SzM/XouyjM4wb1bFYYWi+/nFqZ
	T91g57GHsjqTOcg/wyopAaWtvP2SdVtkdyWCr6HbxviKD20kVroGG/i+f/KfrAXTqRihsPzPkWm
	nw6jZBoJG1jIB+ZnjysyKGu5GeW1dHbmEiRsKuXRa5o46wrnpwa+YTPXCs8dMcXCySZ77Q+lu7k
	dqugjteoKG0ZrNtA9l/n7hHSSzL54WqrCQ7YNHmZljPmx9ayDi7KXyCtvbFt9SxkuxHNRA7mV+L
	XKobpepor/3PLeZIJRORAyFg7Vbdn64EDrkMy+Z2k+AqCXJ8HDIgh1ceT6ZxXM3PIbXyx
X-Received: by 2002:ac8:57c1:0:b0:4ed:142:ed5d with SMTP id d75a77b69052e-4f4abd79a7bmr28425051cf.50.1766139120238;
        Fri, 19 Dec 2025 02:12:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQU4yzy9rycPchG6dBt6pBK+cvMRNb2Vm1Cb+gznhIXBG26wgDUcba13nJs8Ny0xZdgBevhg==
X-Received: by 2002:ac8:57c1:0:b0:4ed:142:ed5d with SMTP id d75a77b69052e-4f4abd79a7bmr28424891cf.50.1766139119837;
        Fri, 19 Dec 2025 02:11:59 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm197282666b.29.2025.12.19.02.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:11:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] gpio: Simplify with of_device_get_match_data()
Date: Fri, 19 Dec 2025 11:11:49 +0100
Message-Id: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUkRWkC/3XMSwrCMBSF4a2UO/ZKkjYVHLkP6SDmeUGTkpSgl
 Ozd2LnD/8D5dig2ky1wHXbItlKhFHuI0wA6qOgtkukNggnJOZvRr5QwOXypTQcU40NM2hjH5hH
 6Z83W0fvw7kvvQGVL+XPwlf/Wf1LlyFAyfeFcKjZJe3tSVDmdU/awtNa+2GntRasAAAA=
X-Change-ID: 20251106-gpio-of-match-23b24cddf063
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qe1g6vLAqNtu7EEUBKJshU91y2FQGa2X/OwnQVn2wOM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRSTonfljpnWP6hKoodhrhaSuKLZHgGp/wZolS
 iMrHOuyizSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUUk6AAKCRDBN2bmhouD
 113/D/98lfgktoyZkbyuDmhOQeJP3DbNTJM+fle2plZVHI5+Ak7Jt44MnYcfk5eZJR2diRg6BCU
 VjDf0E34stmkgnAfAiE+KGjTCMum4uo0E+7qi3MD54G3tM8LwRAadJkJLxUz1ytiWMqY3ylxiQI
 0bA66UE72MQAfew4h0k9wiCWudRlU4noYnF4t1nsIixYx04vmc7eeAK9roTbvOxu9MqEyeBN6V1
 PiDJ3YrUA6C3a3A80vhJyzEERpAmXrYS+6nmJ12F6cXQbrJwyG1g1gxBnAd/GYI4glQsJP1PBrY
 WwytvmF2SDHf2N/tpGQQzRSvEf0UNNOHaQ3bsyxY52ah8NuLTmqPIQcMX+wV+e/JTPii8vwVdnk
 +rp1LqIrgk499zT5Zn9jlR4ecz1nmQaoWsa5fMDPYfB2FWcCplhDHYZGIyVBVBJTuXZGLapApL7
 5r890r+N41BQQkMRwmEPfQaqbae6PkNC9MlOx644o8d681A06Rh7e385j/ouQQcK/SRNxkIDMo4
 Ngr9Sa/lqpMnpzKfdTQ8hVJO3i57S/rkJXx81olk2vnkdIIpfB4LWuJF8yTsKgYThPPLmd+4O1U
 qcBV1fnKQntNrfzhIVzptEd368c6tOISvliw/Pt2LsBmdCrLM8o+HtDzpKkfX7LdHHOqxjvdWzY
 LXMWBKFUMqQdXCg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: AVDpYdzyPGPRFN0FnGWzq0RSgMrhEWGg
X-Proofpoint-ORIG-GUID: AVDpYdzyPGPRFN0FnGWzq0RSgMrhEWGg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NCBTYWx0ZWRfX2UXpg8W3JtYG
 fg9gqX+R4gEifY34XB396M12yzqyrNbVY9jXPAxz3RKnuJwyq0k0wy7DfmN6vw1jvv/3ChOuEpo
 2sftDbecJ4W93VCsMKkIT901dhB1QE84zUw8zzob+oPzdUSCBSrWOXBnI3LhD00lSOH7QO1NnxQ
 9W8Qw1tlvXeQDgBFm1szOsNUu2ed276hzlNzaYha/HYlLSEwipfbiBqMjKXiDutyrWTQYxuykFb
 dwMr7kes1mOg7xUSQQFrmeeIdoSjJcft5VHEU93uWpqKvvrh/DVcyiMs3MBatjXM6mPqNBt2/9f
 3gR7/tC47bTorNvoIMl+lKl0MVQ7zSpxRZDxLW4pfbpfWvLtJX2OGszTxEJd0cJR+1erh8Ajbcc
 E8ClUVr+My6i0MMvsvx9Qwa2Ui6v+K7yBn0IqRDxw4Px7flXMClSB0j23WubnSpUAb6Ajs2swNI
 V9OPyirLI2X5wRoky8w==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=694524f0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Gv4_7YmOpO5FjsplTRIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_091651_205675_DC349E14 
X-CRM114-Status: GOOD (  11.30  )
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

Changes in v2:
- Drop applied patch
- Use device_get_match_data() as suggested by Bartosz
- Link to v1: https://patch.msgid.link/20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org

Few simple cleanups, not tested on the hardware.

Care has to be taken when converting of_match_data() into
of_device_get_match_data(), because first can check arbitrary
device_node and the latter checks device's node.  Cases here should be
safe because of_match_data() uses 'pdev->dev.of_node'.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      gpio: aspeed: Simplify with of_device_get_match_data()
      gpio: creg-snps: Simplify with of_device_get_match_data()
      gpio: zynq: Simplify with of_device_get_match_data()

 drivers/gpio/gpio-aspeed.c    | 7 ++-----
 drivers/gpio/gpio-creg-snps.c | 4 +---
 drivers/gpio/gpio-zynq.c      | 8 +++-----
 3 files changed, 6 insertions(+), 13 deletions(-)
---
base-commit: 26ac2c4153a2c543a4ef3dee421b46bedb0f8f0f
change-id: 20251106-gpio-of-match-23b24cddf063

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


