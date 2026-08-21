Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABF2C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uVDiFV7MaLtOTen7w2TOeC7d49TtNl96rarvyIgayo=; b=hF442IUG7xNidgFJMOKUKHuVE8
	+4RcvFFtAo607Ybkrqp/brKlhink9Hn3wi6j4hMbz57tf7JM/a5jvPg/QjoMY0s1yMh3LkblQmSUK
	9WUhxGq4mJguQq/w3Wm0p2Kzc01hb/q2MEhr9Q9MGR8Da6RTXdoKfKY73x8mFmzzCXnlJeOPgOwpr
	BMF5gsWJMF8qaAWlt3Mtn96tfNB+bk5LgfGBwEqqmN+Ekomz61J8mVfj3r3vqnyfxyevKoXePeimg
	JJz5+jPUg4niXixTIuzWpWGnLl0b7JN+v+ndZ4cngDnnMt9I+xDNk2pnp26PxF/OGzOHTIDfrq+X9
	HO7SoYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRo1-0000000DkoN-2oI7;
	Fri, 21 Aug 2026 16:09:21 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRny-0000000DknM-46EU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:09:20 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFpbfU3808909;
	Fri, 21 Aug 2026 11:09:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=0uVDiFV7MaLtOTe
	n7w2TOeC7d49TtNl96rarvyIgayo=; b=qfhBtvrnp/rSQkY3yGwmXzbkIIgxBXP
	67MY0an+xvo62JcjQsO0ZKL6Rqmd5HgqZ+sQj1Sa1tXzAHEJGKfSFVBjKbl5z37Y
	N9+HCHhFf6/FzWWYf1CiFUb9l4wY4s30qIlYArlsgFKeRMLrwJMNznIWG35dNamh
	6KOJwFfy7gzZKPu4kPfFhmfBcnSAAPnYuJ10bAX3hoXKiMxFVH1USPj7Hze3mCL2
	XlZNno9g7NtW0q/LjtBFJHjemHCdA6hYp02V3KoUGrskC17S5KBSAXrYYS4gxLcc
	mIEw1eI0MIPCXL8YOeUsL/dOcT5xMw/RQXPcBI9c85JeGCEkm4wI5dA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g6c9c47d0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:09:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXQrnz5AxoVyywWiHjipQTv8UVvNn8QwuR2gHjzAzLt8RiAh4nLW1JEx1KIbFd/jWhG3SGq9K4zZ/B7zXYi/aPN4sMkqgD/2t5PP8wj4kKkoO6jVszzqKtkMzBN6A90QeWfUNSg4HooiyxaSLPTUV7OHthZYYAkS1F9wPnVBBx7jnfhIrUUt+cjmhnp/sKeKYBjYhZ8bwKAiZXUy+YVWKdJn8tFzQdfI1DmgRdwBcRzDmfdgHzgcAzi0Ox/ftFFdm5KfbDIg4RkD5wYmyyxbCG66TdWRvWz/NoIo6odpxCi/7lzK/S6Uf67Lry6AclVKqzZeOpiXJBQRRosWG7P1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uVDiFV7MaLtOTen7w2TOeC7d49TtNl96rarvyIgayo=;
 b=HVxshVNmBcqUg3gslhXaJ2m6+712FnVhpGnU7PYzioIz4kE47yHK0AHx2iLDr0ZDwhgIwMuFM86pOAOfVMqFCMuqePz03wNCE7gEMd+qmc2WonlIFvdZTnwPM/SwA/truVsnxK6S3zijbWAIfg0ap/bTd+bmtd4ZzLt4HOgoaA+Mtj5kOemolxnOnYUEDF5r4lMEO1Yhy3046ikLPWRrSa+dlbiN43WBFa45LcNrVynA4oCzyPpamlm/AMOn54gYiuzQpTjobdpzXRmNISDfJUgoszdFO2GLXZKDmulM2LhYebFP7mk6U35KKMIm8uTEy2yUu6vRNlIv4NMhfQlp8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uVDiFV7MaLtOTen7w2TOeC7d49TtNl96rarvyIgayo=;
 b=cvvIbI7Ufq068M7NTWsPXPXE7C5g0O1GziXj+6MmvF+d6kTs6TD3DO+fFsb9Oc9SS4dlTYI7SUqW07wAuSocpw1aZlM8jViI3R22yzkUkE4szW7UypiPHKjQArOiLajfY0pViMKcxbrAfauDFZN8kI/X8jjCeZb/RU7RyJGoffg=
Received: from SJ0PR03CA0285.namprd03.prod.outlook.com (2603:10b6:a03:39e::20)
 by DS7PR10MB7375.namprd10.prod.outlook.com (2603:10b6:8:d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:09:11 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::4b) by SJ0PR03CA0285.outlook.office365.com
 (2603:10b6:a03:39e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 16:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:09:09 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 11:09:02 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 11:09:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 11:09:02 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67LG92iB2411524;
	Fri, 21 Aug 2026 11:09:02 -0500
Date: Fri, 21 Aug 2026 11:09:02 -0500
From: Kendall Willis <k-willis@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: ti: add out-band-wakeup property to
 m_can devices
Message-ID: <20260821160902.dvg7semggxpuches@uda0506412>
References: <20260820-smth-v1-0-e1738a38d58e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260820-smth-v1-0-e1738a38d58e@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|DS7PR10MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c79c12-d1aa-44a4-1c1f-08deff9e88f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|13003099007|56012099006|3023799007|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: ysA773xVYMxRSYA5He7hVwBdNa61WoKc8itfo+Q4HF43CDSzXw5h7y9iOa6elHoPSm46TgdghJv/fU48yndDS3weDztw4jtOul0fR7fDc6MDudNy+cTJsYCQ72EOJGAOg/HxXyDhN1JsAO7Z1mSfVGqtMDCx5fzFxKUPlC/7JwJF6dzbNjzODIdkq+YS5BCX22y62lv5JpcMPZSsonsFEevcG4/HMAY5iKjevrX7AefXR8wT7/19iu7dYUATZBRzkAqL3wrPjYchQGIsWqLmnrKkSB1+xzq6pCyRMJq2DVR6V2bm298VhWFKTrbwEcHABzyH33W0X2wI86QAE1DEZOS7TjqnerEb2H+VM8oIWRxTl//WRJ9M7Y7MKd0li3EbAEOdjePkpaktcxo7r2ofb+InpfwcJL45EZVUeYXapQo0K8CQO9WuqakNbH+cE0KiQmAQcqraHH5LAnFmdp3hKGTwv0XzNO30bCll0ud9+VSG3TwiLzqFXWdRGdZMqgN503v8RI/FXZw7F43J6Na+jmBibaySY6fVi132JQEu+3+gsKATIJjRhGYlMnupZbUBQUAi23G8pOpUTHC98PuU53ReZFWg3iHSUNcUmxO1OMy8Dg1gc3tGVNElmc47pFCT3tcjLzHXbkYyuNXix29svpPMYO+wZF/n0Zy+/sUNB0t9Zl8cRkPIq6mMrqNxXOWzjRTCC0UVpjAJHymOK52Q1w==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(13003099007)(56012099006)(3023799007)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QcG+By6Vx6XhhPowyUUfShVm1vZnX7tAoAH7tgu8QenSVJIfQFDSKw+ZU2A1nfZZpTiLAAy68zJu8v0nDmw/UA+nA6VqVzi4c+DQ2A8DzqXxUpMase5HfZt8nvvrAcFrsvY/PN7jsGU5UBVQNQfY6NCFqXo55QlZEutOp9xjxoXYa0yxX6aBWNTi/i2OGT7k2LxYG4WCZZn4EF2/ISvRv093cibme1U2emGIxM58or2w2UaveAmhYEf52iXZ+M0Kl7JVKeFU6xvJwvE+RrIlm1rk4k1658XZFW6SL3Gy9o3OU1Dy3zYyRqnE/tMs+k4d82ZdjO/ppRvnXAcPElWARk/1vDHb+hmOX18sr4AM5c2As0/2wKmGqL9lkd+DW99Q/56YhdJ0gaGUBl7R8NKYrpxfWV9CPC+u/SMghGGSfZfaqhf9Xs2sdlTP0O9CVt8N
X-Exchange-RoutingPolicyChecked: F7ro38qOfxAai938RQrRttrSE1eV8sgfXXc3Sj1Uq+oULEjtz4MDPq66aYFWM5fzlQI6De3XagqfulMZRdM8DFLEBC6oR/2J9laEI/TnS3nShqOcJudk0zCGPOBzt5nmxHvLafISGTA594GsnSspn+/xtWJFqJlDGoDHpaPyL95Njxz/dv1RnnN5bNQUrrRrD2h2rJnJ91W1EJABOUk7VZPUTUu/cS9Tkphn4cu28aBZTz7DqIRUtDow5BqkQfoPgaODom4mxK4LL23Nw0fh2FW37QSZrCqA/39l7vnIz3IFxmEgp7obzbp9VB006bpjU2gRuEqKKbJXb0uADTFA8A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:09:09.9797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c79c12-d1aa-44a4-1c1f-08deff9e88f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7375
X-Proofpoint-GUID: nY5UgvvQ7YBm0lLHjGvYAHhB4JoBCEal
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX+keZyhowhlK2
 zIlOZoNqhu4IJcNw680rSEC0xUNfHPIei22u43amFJW7b0cNdvEkhYb/oAZls17eZXHzop2LHOy
 cXIetTjtlxvOv8dYA+3joj4OBaqDEGQ=
X-Authority-Analysis: v=2.4 cv=eqjvCIpX c=1 sm=1 tr=0 ts=6a88782b cx=c_pps
 a=FLJGh2IUmjoo+n/grE3sag==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=NAG9LX_4pATzhbKSTpEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: nY5UgvvQ7YBm0lLHjGvYAHhB4JoBCEal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX7LcTYf/7AfSF
 ZsUzRy8JseXCFd6k/bJpo36zdqUSjMS4JTnEEgRig8lI42afeJHP5+tePxnXPYYwwZ1ZMpwuAE5
 1UAphuY3plHsHLszfQy0iWwWzb5elRdk+m7ryjvzt66hSs7Y/RMh3k7UyFDU3kW9m4Hh/R0w20O
 Y0KlA7UZ0nOTNdoiByv4yl/0Qc1Ywzh/yHld27GIgf2RShMxU9lg8mxOn+lnsKRXM/eGbPdHWia
 LXpZ0zfYloJytpO9UIJyT1u2yhGVr7BE37p+awJg8ihQ5QAeFjKd7SCSxP54m5btBWljCDYF8Na
 ZMQzWP6XVoyEC0S7NtBV7r1CillbYOmL0d9AusqoZkqru8PK4gVcRAHycCe6pxZl5EI6QB+WBTP
 405ajnLQ8VxcNtYAZOKYedgmqSlI1CwpLHiRpBK6mwPztYf988vzo+uDcdSUvInn5JrNjdims0t
 T5U9XvN/FryOeXB9aRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_090919_317675_AD569C1E 
X-CRM114-Status: GOOD (  15.68  )
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

On 17:08-20260820, Kendall Willis wrote:
> This series adds out-of-band wakeup support for the m_can devices in the
> device tree of AM62X-LP, AM62A, AM62D, and AM62P SoCs by integrating
> the out-band-wakeup property.
> 
> Dependency
> ----------
> This series depends on the "can: m_can: support out-of-band wakeup
> capability" series which implements the out-of-band wakeup support in
> the m_can driver and dt bindings.

Additional dependency on PR in dt-schema repository that defines the
"out-band-wakeup" property:
https://github.com/devicetree-org/dt-schema/pull/205

> 
> Testing
> -------
> Tested suspend/resume with CAN wakeup on AM62P SK EVM.
> 
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
> Kendall Willis (4):
>       arm64: dts: ti: k3-am62-lp-sk: add out-band-wakeup property to m_can devices
>       arm64: dts: ti: k3-am62a7-sk: add out-band-wakeup property to m_can devices
>       arm64: dts: ti: k3-am62p5-sk: add out-band-wakeup property to m_can devices
>       arm64: dts: ti: k3-am62d2-evm: add out-band-wakeup property to m_can devices
> 
>  arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 2 ++
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  | 2 ++
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 ++
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  | 2 ++
>  4 files changed, 8 insertions(+)
> ---
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> change-id: 20260819-smth-6fb189fc148f
> 
> Best regards,
> -- 
> Kendall Willis <k-willis@ti.com>
> 

