Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5DDD59D62
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xk0qveIVY5Zsh8cxOmfmmx5OnrpjWBqToFXdzlLfIQQ=; b=dZ286gJkIhXAoTCkiCWiGQvgSO
	Byx3Pbeau0L8nv42WLhXKzKsCstOrDfAEfcNN0sxiCIRqvtgY3dv9IE5f53jWxsohWystOIdIv2jk
	wi8qPTAPyr90j5RQ8vFd+oiBhQGVGKw0Zkue39h8Z8yrXdxt9LkWqHZCfdgMmkAuIR/cqUfbw5H+i
	oZzJ6dPsqzbT/JtHRtmugIzL43nT3SGjeOqfJFP8CQvZ0OYuFMN5Om2a7TeHdLTi77MtkP8joZPMN
	iNnpFOEAaU3Mf2wqYJ8LKAVoXPoV1V3TVFYsbihwZ5hNhD9gvakfugMTGclx6VCzttB6vrnvVZ/7y
	uoo19bTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU51K-00000000hOU-0qGp;
	Fri, 12 Dec 2025 15:25:26 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU50Q-00000000gOn-2q4p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:24:36 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yW0FWG1GKts5eanXfjVmzBHMN81o8BVKiBWN4Nv3f1l8R2nxbpVDYjYsxQFYdQhUmoZCUc9DOc49cgPMDHzyRMRjGzd1cAYQOohsM6Dy/r5ys47MDDrUsqCZDteZC3Pmxiz7FD7X3M8yUCIdXHjFNcCNmjVckqHD+Ilr7ZL6dVRrLZWnF3ExXncVMevPj/1ghs0j7weYNhUpvWNcVJh+aw+dt4ArVYwviMgMN6bIWJidNTbD10odXeCmhphLj7uK4y9w2JNOgflIS03yjt1BmPrEKdMzNiVwKKdv5djOMU7IhfilC3Wpj6aEzluSy+un0xm47bOwgipj8msrucErKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xk0qveIVY5Zsh8cxOmfmmx5OnrpjWBqToFXdzlLfIQQ=;
 b=nnNxUmd7B8Go9VI5Ex4NgwPxjHxVOOnK1McQbt2vfiBYDdGtChP3qMPvjoPdW7K3dy8BcPEBJeV5lDBGqscvKrKjloiAnyfpMRjte0GFo4fvaCOUO/nvIILiB2Y38w+3YgfCrWH6MG9zFLECTuNMnh9zw1lmezR5myGI9xbCWyOD3FzoW7Ekod8FoEjyaz3RJLVXnNOXFcTbT/qfl7xrjr/6a7lm6Es9gko9QB4nSy9QFLh3eUjCC7YiEeM/vLSi204ISNg8Jzg2t3k8+19qK1/e6qNPyPl1+IZ3IiJHE0bzdcT/Mn9P50R95R6wVCO9mYsPMYzTt7DWEmmZQYZVEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xk0qveIVY5Zsh8cxOmfmmx5OnrpjWBqToFXdzlLfIQQ=;
 b=W7jwAEkKr83vM11o6UCqp3EAPzI8sllwIrjDYXVOsP990bddOE02iLF0OyTo2mwdCSPY0KZWHznE/IZ6eZnXF4smInRmo8ZHxMkcWsjUjAmnLDQQOJY1FDM/EdSnp36j2A8JZGWcNBMx2LVUdMnVD7vGqciwe6D6jpXTX8c9x9w=
Received: from DUZPR01CA0330.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::26) by PAXPR08MB7394.eurprd08.prod.outlook.com
 (2603:10a6:102:2bc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 15:24:25 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::53) by DUZPR01CA0330.outlook.office365.com
 (2603:10a6:10:4ba::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 15:24:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Fri, 12 Dec 2025 15:24:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qp5flndx4duRjdVe7/iN/0pPH5X5nMnTAD4AmNp0KjCeaGS1V460znqD/j5ZKG+8eNhyq0Zou9Pqh+jdn+/ObyjsXBEL1tX/bNwXQWW5bnxy+2368RhKVStAMHv6d9FeSzFiDpT3gyVdPGPzbkR84rXqcRe3BKJIcec5fEIPXOe07GUJKLwNY6JznBMAjQdfEO2BXtEotdY1/F9i+cIDgyuwGPPn7ysQUWxWLgh5ctrZLeHc0JL7fRu2rQBjQV0j4Hpvt/9P3REw6Vr/BTByggKfdEy9WjL6GFrQvZ43Anrol3VRxo6teQTJIWhm3XG0TAiVZKGJm2bsiJhDynvb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xk0qveIVY5Zsh8cxOmfmmx5OnrpjWBqToFXdzlLfIQQ=;
 b=KlcgsO+2F8IDlRcZt9JgW7lOsn9Idn8BgGbuN0hj8Cs0d4CNOoKr66Spjn21EJ2iS0hvaHb9bzZuJwp+JYrjMv2Gfor/BebxapeVQAQv6fQ0Ol7EkwtuDtC4Hay7XhUpL9f4n4rQMFpNiuFrdPcGD1b1ZZeszOvRBNJjqel1zx2VrpoZZ0rSXh+z0pFYvrHvK6cLf/IqSKQUB50xrtWVn+5iRa6R//Rua+XrRWrN3Yh+azIN2AChE/ly1StV5x+WRHY1upWB0o9AwQBBo0TD6WRFFKcPcF4v6Atajd6fPbRNRcs8XspKL38fsPcQ4tJEa8H62pL2U3PSDDkHYYV3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xk0qveIVY5Zsh8cxOmfmmx5OnrpjWBqToFXdzlLfIQQ=;
 b=W7jwAEkKr83vM11o6UCqp3EAPzI8sllwIrjDYXVOsP990bddOE02iLF0OyTo2mwdCSPY0KZWHznE/IZ6eZnXF4smInRmo8ZHxMkcWsjUjAmnLDQQOJY1FDM/EdSnp36j2A8JZGWcNBMx2LVUdMnVD7vGqciwe6D6jpXTX8c9x9w=
Received: from VI1PR08MB3871.eurprd08.prod.outlook.com (2603:10a6:803:b7::17)
 by AS8PR08MB9386.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 15:23:22 +0000
Received: from VI1PR08MB3871.eurprd08.prod.outlook.com
 ([fe80::98c3:33df:8fd4:b704]) by VI1PR08MB3871.eurprd08.prod.outlook.com
 ([fe80::98c3:33df:8fd4:b704%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:23:22 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: [PATCH 31/32] Documentation: KVM: Introduce documentation for VGICv5
Thread-Topic: [PATCH 31/32] Documentation: KVM: Introduce documentation for
 VGICv5
Thread-Index: AQHca3srU85q+1+8HkCPlW7uCaDOiQ==
Date: Fri, 12 Dec 2025 15:22:46 +0000
Message-ID: <20251212152215.675767-32-sascha.bischoff@arm.com>
References: <20251212152215.675767-1-sascha.bischoff@arm.com>
In-Reply-To: <20251212152215.675767-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: VI1PR08MB3871:EE_|AS8PR08MB9386:EE_|DB1PEPF000509FB:EE_|PAXPR08MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bccca3d-4e8e-4c33-aac7-08de39928871
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?Tmxzecmp/jik4muj3NVLNUrA+wRB4r0gTSwXmEWVzkckTfRXieQlwdEFXU?=
 =?iso-8859-1?Q?Sv1cjwhFJRE+n7Bf01BLboE6lWU3sh+DrxalRcPX/j7TGEs18of8boR05Y?=
 =?iso-8859-1?Q?hQZGhRl5KFInzxlrUSXA1M3OblZjZ3+7er/kyjE8TBF8Kmnwb7a4/Qv1LL?=
 =?iso-8859-1?Q?zKcd9JOygXqwfuJbV3XzXdK6BZFve+SvugVzyQ+mf4BHkiGZsP1YnPyE6o?=
 =?iso-8859-1?Q?wJ45jyu7EpXWw1snMDkDwtTXEZV7E306+w1bsemDWhOB1q5ov+tXyaCrkV?=
 =?iso-8859-1?Q?jr9uiSHE3BusUoPqHWrPZR3AR428PUOgD/q7h+GHwJghOVunoYhDAUQZuZ?=
 =?iso-8859-1?Q?2BczVxONRSGRYckfcYCLkfHilbUWdWHLakMxVTGvBmD8NTyr8L84T/QVgi?=
 =?iso-8859-1?Q?p+7+LyW75UjGi0I/6DkKwMmMc/m+l3754mQNY1VKwReDXd4Q8lXSc4a9Vh?=
 =?iso-8859-1?Q?mGhW2uBcGe1YvpgCeOuU4DNIgHHg4auKL7QukV8SvenItAVTeAmOyWZ3z6?=
 =?iso-8859-1?Q?/df843Z+Z+ZOPxXwFd1Dfj5PuW40RBI/m3SJhDdP81bXnVC4J2nUrcZAxc?=
 =?iso-8859-1?Q?6ZVWfjCPzliNL3b0ohdj/UH1yCI6r2C5QxExK4w18zDk9TKbpIgWKhc3H6?=
 =?iso-8859-1?Q?D9X77RTCkssbyTZHBSFPC1vsU4IJQuLLQCrflIHk9ZiAh6Yc5Bf9rNqJlD?=
 =?iso-8859-1?Q?Pe5MSlQqG3wZ143kSEpKl4DNp83DLDBNayAQX73RRxkaMLcffzROq/LtZT?=
 =?iso-8859-1?Q?1GBp9IEpDbvTCPHUh5/RrzSNSVvSvyfPYgIIylmWsOxtuqmjJyERkrfHGt?=
 =?iso-8859-1?Q?PPEKw2+fj2RU/Pov6uUjE4JxaGW57P195AfQvoHgx+MRXNvhsL3uSiOj1i?=
 =?iso-8859-1?Q?nBo7Hgmef6VQH5JwjisnzmeaHPXmDvYgYvU2HCFC5LSvXyz/A8lV4BZWtE?=
 =?iso-8859-1?Q?NPV5lztsEwUVMqFzv2ZQkHhJTaXXNyMnsVuA/NaUJ3IrWKCVCoftfw3Qj0?=
 =?iso-8859-1?Q?J1LRIWsqucOC/jqrE4oopypNhzk8KQ7uxH3P+/vbxjyAtmpns050XdW0E+?=
 =?iso-8859-1?Q?GTQICaBWnSZ+FhzZBcM9e4EDRWWWgPbLtkm44O4ex+kpE/eq0RO8LDbct8?=
 =?iso-8859-1?Q?kxRAdok5NbfsbNovZcIZs3faZJvkLv2dnVd15ZPPwX/KRI8sdJs40lyf29?=
 =?iso-8859-1?Q?G2qGKTTlC5AHtzPtVY/kn0gFk0jN5LhNA5NlGIqHs71p1SO8TC9ub0miUM?=
 =?iso-8859-1?Q?iKLQChAlSEVxBIA1Y7I5i50D2Pg4mxtKv9dFm4Yks82dIQZlQ6Nnn43Zf3?=
 =?iso-8859-1?Q?e5rJ/vydbUyFb8Ycu6E5E1XFkekhnbqaQJbG5qHgG4DY2riY+EfjJ2mnd+?=
 =?iso-8859-1?Q?UkszTRGtHNcrpRKN6V586JbYl9vV6m4jDo7MLdNNJ5y3dwxkob88KtwnC5?=
 =?iso-8859-1?Q?3RwEqJQFwbHcoXWWdtTe6h9RG9AndBEF+ijkMbi2Mfd6ffiDuIwe7bCC6G?=
 =?iso-8859-1?Q?dgWr+zjSDyy/wRln4OhvN89WqPFvzfUlwo0mrRxW23tINPYlgHyZtY8bLf?=
 =?iso-8859-1?Q?ns/hXdeB9l4JFRLiC9MejMEyYvQC?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3871.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9386
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 455b8ffa-51c8-4197-8e8a-08de39926304
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|30052699003|14060799003|1800799024|82310400026|35042699022|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?kb74wSq1SoaePfvfXaPPfRoN/KJcdh+lPeQQkFnUsHMkpvbniiS9+WqIuX?=
 =?iso-8859-1?Q?ckNAWoKI/1wZZGqi/HcGB2y/iMD2t1VQBG3zd8VVu7POJIAFbYfOjjf9QP?=
 =?iso-8859-1?Q?ZiWk9QSfq/70XLK+3oJKKYgcdrA6rrHM8EF0Yo3JnFWsmXn76x6dYMsFIc?=
 =?iso-8859-1?Q?p8OXZLGMgudIS7a6o3umaQmpOnDvmGjWi7A+h7ll1+bPX18mWsRbkg/+l4?=
 =?iso-8859-1?Q?pOuZMq9UJIx+NXGvBh4rgVC37zjDJ9Kvbyq8360S69E4NRFJWv7GEywF9d?=
 =?iso-8859-1?Q?/GSkZxuOrQDQY7vA3SHyS4+GRoIp5o/25HhxB+/TW8ECjpFRXAKUS8UzpK?=
 =?iso-8859-1?Q?0/v+lRbPRYMPPE91SzW/Ksxm09x68ZsJOCUIDY8BvB+neToLza3XT+97e3?=
 =?iso-8859-1?Q?OhF4h12oeQh30EujWgV1DNaCB/qwpgZMUsIgQ7appPtafDZ1BnOubzaSec?=
 =?iso-8859-1?Q?rqzThYog20IPM72HRi7N/5oEPIt9bENWVeqJZOiCYz7MT+6tV51KyqaWE2?=
 =?iso-8859-1?Q?DKvyT+HwhCcgZGLrIyCyEb2a6PwqpmUlmyOZO9aKD5eLjFpMzw5XZMr4cF?=
 =?iso-8859-1?Q?OUfK+U7hs1Y3WjzCDUVceUjBsfP5CmiQ8p0fGv50zhUEtOoWHHTMmJFER6?=
 =?iso-8859-1?Q?+7/sfA6dPouQ6ButwEMjh+lF2t17XiGiupAP26sknt9EZpCpkCe6CJco7U?=
 =?iso-8859-1?Q?7VrOr2+rWnNowlnH5hT+80wI8fPFW4eaLlISLUEiuyZXjadzeErKbzy9wq?=
 =?iso-8859-1?Q?hvy2oTNjntMTXgmZV9ACMj9dOC9YX4YJ+Uzo9Wwtc+wNC35MXWAosHNahY?=
 =?iso-8859-1?Q?NKUtrEbPhWsdYRl0br8ozInu7EMAMV81Y1OGYkm8ciFg7vTk+Xd/krPMdH?=
 =?iso-8859-1?Q?fkki00BWF2z5begKrw4K5j18pacTprI2CSb/W6sJj0rLuG7nPbtvvXMSJF?=
 =?iso-8859-1?Q?GQePBJwpb+RC11FMbAP5bcuAsOvlkGv6j05U4cb1eIwf/YFOnYJw3CecgP?=
 =?iso-8859-1?Q?ehDhbXwheV/xnMDpmg9UTigjLLFmDmiV1MUQEVCNch2BEB81/Lnoee+rQ/?=
 =?iso-8859-1?Q?dEkTNMri2Rr4MzLBvtv3vY7VA3+uL1egn+/RVXyKPUEBS7S3Ik86luZCaR?=
 =?iso-8859-1?Q?wAOIcGGnh0Y9awL1Z0GheEL+m2Q9MZM3PTI3Gh3D6jD508H8W+hPFodymP?=
 =?iso-8859-1?Q?fmZakYeCDWsQUzRVRZnewhXPL9MDJ1BV3IIkU+naHueLWE6igTLXERC5/a?=
 =?iso-8859-1?Q?NzaCexKcL6K5gRf4uTBJH4gQUX9RwAhFhMnk1gFx6sIlL5Pd+boniKXP+F?=
 =?iso-8859-1?Q?U2X3VP7wIX2EHZ89zot/h5Q1txByDOLTaXwLedQyq31jctpbzsvyUdG2ry?=
 =?iso-8859-1?Q?dvgPXEu1VUC5YuCgHQ16W629vqyOL7csMRYA32t8ZqzKpl9YxeFoQhT0ex?=
 =?iso-8859-1?Q?GlHlV6j31PvYA1IMz5tvSLhtj/DHFk4Tg0vyh8TxKBiSrLzEQcLKNGqZ5v?=
 =?iso-8859-1?Q?R8feKtJrswE+E9yZbhwrsyvmFcLvv8j6WnFLy62Ux+d1OXKqKa9qi1DMDz?=
 =?iso-8859-1?Q?f4uPrQA9Pt229ea725mwziJ+8Mh5xZ6LMFmsHcx8orZnBkr1HZcRVsuzXs?=
 =?iso-8859-1?Q?NiGXgOPJD5xxc=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(30052699003)(14060799003)(1800799024)(82310400026)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:24:24.9320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bccca3d-4e8e-4c33-aac7-08de39928871
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_072431_361294_74920C90 
X-CRM114-Status: GOOD (  10.81  )
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

Now that it is possible to create a VGICv5 device, provide initial
documentation for it. At this stage, there is little to document.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 Documentation/virt/kvm/devices/arm-vgic-v5.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/virt/kvm/devices/arm-vgic-v5.rst

diff --git a/Documentation/virt/kvm/devices/arm-vgic-v5.rst b/Documentation=
/virt/kvm/devices/arm-vgic-v5.rst
new file mode 100644
index 0000000000000..f6591603887bc
--- /dev/null
+++ b/Documentation/virt/kvm/devices/arm-vgic-v5.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+ARM Virtual Generic Interrupt Controller v5 (VGICv5)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+
+Device types supported:
+  - KVM_DEV_TYPE_ARM_VGIC_V5     ARM Generic Interrupt Controller v5.0
+
+Only one VGIC instance may be instantiated through this API.  The created =
VGIC
+will act as the VM interrupt controller, requiring emulated user-space dev=
ices
+to inject interrupts to the VGIC instead of directly to CPUs.
+
+Creating a guest GICv5 device requires a host GICv5 host.  The current VGI=
Cv5
+device only supports PPI interrupts.  These can either be injected from em=
ulated
+in-kernel devices (such as the Arch Timer, or PMU), or via the KVM_IRQ_LIN=
E
+ioctl.
--=20
2.34.1

