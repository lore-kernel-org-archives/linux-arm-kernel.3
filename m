Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662F5CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 06:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPP/EyjT2wII9bMHLU4QX3es3K/LqGTkzbqM6Papzbs=; b=dlX+sn1/f9aAgzfcMb2lWt9guF
	eHTNgz51WiZe5P4EHrrxUYO+taU7OE+xmdk8/jllPIg4RFcwvXJDlkJWUjRKDi3bwVZLHVOaeqZ4I
	tBHkRnBPPGDxBT301AySjvXRYZacbvxT1p54+f6lrJSCrkIWo3TbqQhNbxZwbR9Po2NMnkpOONB3S
	re2NzsocWA6LOY1P8uJpeCkglUeOwC/MkoUNC/TLgiKZ4VLRlzdAK2n37nmiOZg5nV4jl13VTnsq6
	hIGNQrjmgsGsQHBo/BO561fBE9QTajJkOpFS93R5jwp8eBrw9XEKKmJwRA8JmF0Sroka7aYSJ9dA7
	SBgDN0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILp5-00000004rUh-0R5n;
	Mon, 10 Nov 2025 06:56:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILp2-00000004rTS-2zOT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 06:56:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA6Sdl92408341
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 06:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPP/EyjT2wII9bMHLU4QX3es3K/LqGTkzbqM6Papzbs=; b=gnYYw6cpx0Fjen+H
	5qy7EDBTI5wzHU79FunFy8v2oOvdbsBpNa+xlqa4ZQ3vRMfqCy/4PmHkS4oQ7xf7
	lNlZl4MIrrQNECJ91RW5IJO/EINtjC9NMot89W9MtfyC26BvVzFauBh5XzIOYTWb
	7snJMy0+nVwcETJ95QvtfYDiWqjyxXnufN6B+6vf6B4kspbvPUbSTVXcQH0CJGmW
	8UElZWBfup89uCQp+lQpx5kgls3xDWjN0LgXa+ZNq6i21HcVxq5Tgoa0wtKsu/yX
	KJwtHAYxU6pi9l+0+ANMArqP/odd1rOG1B5WvVcBkkCRbkYg6l+WXuz/zESO5FAk
	nN15SA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abatd828q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 06:56:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3438744f11bso1319770a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 22:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762757775; x=1763362575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPP/EyjT2wII9bMHLU4QX3es3K/LqGTkzbqM6Papzbs=;
        b=C6ATSywsssJdF8xgv43pC7n4SfiU8PRQ+BgwtVe8ut9ACrJaqSE119gPuv/y7iLChG
         bbSdi3MNphQLW4jT+w2lzC3SEeuiTAjl+K1MSClVutE+hqunDM6colKeDJF57JFLn+qM
         escKfO2WWdF5n3V0Xy/N2PprAFiSPTQ8Eac22GYdd1qUrogA7YEeT0+ivawd4TkgSo44
         lc2FCYgQ4H7qcaChYLePJDEeWw+P63qHbK8qcq/OjvZ2xE/GauVWvZqk19hEplqO5lu6
         NIv6XTURUIdb8H2szlO/yDzy5M/uIgW+3HQYSTDzsRVZq/V4sLIUrD0K0T1ohjHbgYm3
         N/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762757775; x=1763362575;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPP/EyjT2wII9bMHLU4QX3es3K/LqGTkzbqM6Papzbs=;
        b=fUGjpsjuK9JYDuNKyS2SJehL4AYuxl+rA5ZBqkiqzZMgXyc3v9FRqU2RWQ8I0hyPTK
         uJOttKM465gIEk4T90SP3+9c6LHjoTS+/FB1yCvXfNTo5guzs4AKVGS7p/v10vN4wCKp
         hac1JlDJ1/mHgsySE/IE+V/LJJwsKuK8nRg2J+AFziJJD1ocT8QLIpuaFWsV9mrOhYIA
         f6nk2MaUhPP96htryqiJZMg8scYWmulgAc9p8xV/ObQXZOMY/TTk8isziWCw2cbp/ESf
         xo2mEbtWm41zSPDVKyNgBA7jyKKVVA0waanMxEZFUZQHZe1LUBAS5WNaTtfhIaeM/2yE
         puXg==
X-Forwarded-Encrypted: i=1; AJvYcCWKq9e74c4QyRUKiKZcC+pFTUTMA8ubua2ymWkksi3hCmkZDEE13hKNL+2pkdRLlcwNPCdHtm8SIteokLlFfDkT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw6C80sMl28V1VSCOcOiLxgx50aqYNyktz+eAZn/frKCDaOjg8
	KFVw1HLq3EnBADvwV2nuB0cM38OQTtP1C1g/CZeeYZrPX7NhjTrLfwtKqEs9V/jhavXym9SFSwP
	QxalvDD0qwN8NFx1bsuTdbd8Ul6dviVC+cgarIwxN+7RBSwxam4N7WSJ1rx1sCvcAV7PTphgJX4
	vgcw==
X-Gm-Gg: ASbGncvK9D0z0hltNbty0czh0RBZRFLkVokIC42oaGTsKRoI7WvSabDU4Fo1HpGnaYa
	TwPMfW18RpzRv86TgX/hr1B9pz1WvlBb5ZgcOpD7mQ/sKe4b5qW3sjiNA2rqRc4uQPXN23R8Zzp
	J9wpNGHHoRq8x2puiDtnMhrYGBnaZ4nLVL924l57QINJPIEjtP2DZHvQySDOiGjt+gkUWeKftsU
	gBWAQJ0unAPIbpXoNA6uGXX0YOl+rH95kOIrP7ErxbgxcXSVbwmOuEhD9GA4frzEYPSCHRR/O40
	NHDDYPLlnMEi6Kr6jkifzpAGc8nbK7OMIcWOPM3Bkoqh01eNEG7giyDBBkfIReWJL7I+jlwFK7+
	E
X-Received: by 2002:a17:90b:5710:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-3436cd0f1f0mr10125501a91.36.1762757774586;
        Sun, 09 Nov 2025 22:56:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYMFCEW+VsM+etUbmQ/zHKtVvlMdywCxJgC9tLLnLF4IVTMN7CmfPAWy4Wy9Uex9snC5RxDQ==
X-Received: by 2002:a17:90b:5710:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-3436cd0f1f0mr10125465a91.36.1762757774113;
        Sun, 09 Nov 2025 22:56:14 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:884c:92ad:3fef:1d6a:49a7:308b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a696dfe9sm16705022a91.10.2025.11.09.22.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 22:56:13 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Jingoo Han <jingoohan1@gmail.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, stable+noautosel@kernel.org,
        stable@vger.kernel.org, Linnaea Lavia <linnaea-von-lavia@live.com>
In-Reply-To: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND 0/3] PCI: meson: Fix the parsing of DBI
 region
Message-Id: <176275776139.8821.9724702125495761876.b4-ty@kernel.org>
Date: Mon, 10 Nov 2025 12:26:01 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: scS5Iod4m0k-iWbxLaU_OiMGzXgFnuRv
X-Authority-Analysis: v=2.4 cv=eZowvrEH c=1 sm=1 tr=0 ts=69118c8f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=F-EKWGjZHOx0vckpNnAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: scS5Iod4m0k-iWbxLaU_OiMGzXgFnuRv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA1OSBTYWx0ZWRfX5ZG+hhYcX/hL
 oNT0I1lI7H3H4VQ/DD9cl4vqKsj3NQ2FE8G11ec1GR9ZEMiphrRWVTw0OXWdqtRYDh1kVtt6xRM
 h1ORPG+N6xR76slYl9TFQNf8v5w1vIU3VM10QDzMzJZF3drNgSRh1DoYxSVYSX4lMNQDNTNRb4F
 nAvtv693wJBPam/VZTWwoauI2vAEc5fQe+WTCC0RslQEIiHe1CMwwyff+8+vT+u/cErMmyYLssh
 RWG2oOLMMhIXCdVkJXaVvIhD2GI09Wa/gLcnSMKVLKH9r9UJAGV4CJNcIUhcrU/FZ9uB+7pF4xY
 4S+tmn1zc70WngOObhcw0kMHxdG0yUqDEhew4oQLULg3QpUrSchz4X1Dtx1TMPqq8pnfo1AElXf
 k3O85V+2wxzrwa4IhpGnMaJPSf4fMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_225616_768852_014261A4 
X-CRM114-Status: GOOD (  12.76  )
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


On Sat, 01 Nov 2025 09:59:39 +0530, Manivannan Sadhasivam wrote:
> This compile tested only series aims to fix the DBI parsing issue repored in
> [1]. The issue stems from the fact that the DT and binding described 'dbi'
> region as 'elbi' from the start.
> 
> Now, both binding and DTs are fixed and the driver is reworked to work with both
> old and new DTs.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: PCI: amlogic: Fix the register name of the DBI region
      commit: 4813dea9e272ba0a57c50b8d51d440dd8e3ccdd7
[3/3] PCI: meson: Fix parsing the DBI register region
      commit: eff0306b109f2d611e44f0155b0324f6cfec3ef4

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


