Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BD510706D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLupcN7qU2goi7o2LzvkzQGTYCMeAZry5InsPLazgI8=; b=vVCHTBOmHVQb41K4IkwB1FSw+L
	Ece4NKrLD8vJICXsfVMBnMrIEZg7yZF1Pk7qbl/RnU4lHoMgoB/G8w07saHUx2PQWdfEcCKCt6CYq
	N/tZPWpSnqo5oge5Z5bt30FBaR7y2UZDNCXJFPIirVUnDFarqv0zeADAvXNf1zaBpdfdiqINSeuhD
	L363UdyBAelPZ41nO/FJm2UPTpUBefzqgxmbELrqT7Uvfaj0ZQUPWiM339usWtUKg1URSLUcC9S/Q
	b5hxEMgK3no9ujGlj3NbvL4PKpIZjPmW/4uJ4VTjRjzAOCBeEBetzrqcpu1GssW0vd5a22vd1VzCG
	+C7PmH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Nkf-00000001o3K-1XGT;
	Sat, 14 Mar 2026 12:05:53 +0000
Received: from mail-francecentralazon11023087.outbound.protection.outlook.com ([40.107.162.87] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NkW-00000001nrk-0yxa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:05:45 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NvUHaSx+CD9F1aW1E2ED+vhcXOcJvVfUKy6vgAvpZB3W/EGW75CYO6OGR8F4+aLFpysNdeascdnm0MfZhFaHugE65fc1m6/v8ufDjIebO8rMh4hhEkiZoi2EAEqFjcZ0PF9b69Dv7pI/Zf2Xq9eqv6QFHy0/jApOI25t8EjLNMV2K2pin1ByNLqcs9puzkItoiNmZMi4E6JH3PJTP2H5UYOokzDYP4j3l/PuvtAPJCeIQZXv4VlFJlA9g/5dmD99kvWNuG69Jq2EwI1D9zR95Y/3+QJD4dTJJerDlnzXoii8sQs+t/Hyh/aLie7Mppf1sdP84VjzKDBbJOo1T+OTbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLupcN7qU2goi7o2LzvkzQGTYCMeAZry5InsPLazgI8=;
 b=PhCpZQrO8qGTlicfYMLT2wiXllyp+awF3hIC75eIprMA6uBhykjWs8A7E0WLFAdKQRUfVNghjzz9xBdquJkVr1RMTzO8ufzS4GDE4T2mf99zGuJvWQE2XxRBzR5BoTkzd0CTzCg4D53o9G58LbRAsNKi/O/AaQPAREGAtEi7VAKzEimRkl5jUR/+fJM8Q2tOg3fkyd6cdv23GtDVyacNMGOdkqUfF94uqp9fQXkasIVmBvpC60d0eWh7oAvopqSCCvc32bVVso569C6K2w5AyLi614NJX7/SzUKi8tYnYBD9rQ+lYmQTumWYTsK/8/A5gdr56W2jMMEJgMAh44z0Tw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLupcN7qU2goi7o2LzvkzQGTYCMeAZry5InsPLazgI8=;
 b=LfNfI3Egfa0gePD4BVjSe0WY9vo1dspK88mY26hqFes/iggYpFexi9w8+szY+kUf7ix7ZAA11h7A0jFrsuLdqc19eimp9B+a8RLedpWgZCXzET07WmG3mqmTwZsA+oLLyUw2wYTohcnbGs50duEoBVzlVtzeYqOgC9tYSoSI9Bo=
Received: from AM8P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::8)
 by AM9PR04MB8618.eurprd04.prod.outlook.com (2603:10a6:20b:439::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Sat, 14 Mar
 2026 12:05:37 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::59) by AM8P191CA0003.outlook.office365.com
 (2603:10a6:20b:21a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Sat,
 14 Mar 2026 12:05:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Sat, 14 Mar 2026 12:05:39 +0000
Received: from emails-6643282-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-17.eu-west-1.compute.internal [10.20.6.17])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id DA4B580119;
	Sat, 14 Mar 2026 12:05:38 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sat Mar 14 12:05:30 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ga8YUqv6r++lwCXYpv1O6tKp0ZoRWn4dYnH/cF5nsaVj9vDUEnEmfGZo8+fpfM+R9ZtGoqc8csN7cb5WXMFJuFLWhBcESKcZ8sL6C9i9H6xqFvk+uHCSm0lc9MAZdUGwXL4vqNBLmJ+ZD1mP6/jUuJT6u6rT7wBzHti6mjaWnQIgtB8m5U4enxb5HfO+Oi2BghBZiSdREpDfZ63Tee0vILo3FF25anCzxnnNSAy34mtA9gv76NthC9RWd8XljgsR7htW9ne8yIfxet5rC63yYbwFUAxmu8SSPKC0zAc1TORs6ufVJntcbrYMzwFDZJwpFqVdv7n0JrEqM5lF2JrAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLupcN7qU2goi7o2LzvkzQGTYCMeAZry5InsPLazgI8=;
 b=t44E0DMJEXPMNmZKboLRqL4pqusBl3HebpO2Zt/8P+rQee2gKgubfmQow7WvPQOH3z2nrDLCcdYybq8KbL6uffOW+9HGqNFyh98vN0OPuumysDCanM7+dp6HUcTJ6zA1CU4SN8KFLc+vjzeyAZ20TT87+9nlZPnCLxhokgajkb5tbQhSJFvws+4LIlsilt0nTzeHMIlD+Cfu8if8SGtPZv6Wf5QRHsU9rf0jKotMID8tW9qSFhNnW4TriqEEtf/sGfp5XhZyeYyP2a48Q/ioZrMfOQ1GiiKmtfcDj8xw6NaIHzjdsi6xmLJL/rwwnsG2yajYVtIvE9gwt8FWWvrszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLupcN7qU2goi7o2LzvkzQGTYCMeAZry5InsPLazgI8=;
 b=LfNfI3Egfa0gePD4BVjSe0WY9vo1dspK88mY26hqFes/iggYpFexi9w8+szY+kUf7ix7ZAA11h7A0jFrsuLdqc19eimp9B+a8RLedpWgZCXzET07WmG3mqmTwZsA+oLLyUw2wYTohcnbGs50duEoBVzlVtzeYqOgC9tYSoSI9Bo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM7PR04MB6805.eurprd04.prod.outlook.com (2603:10a6:20b:dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 12:05:04 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Sat, 14 Mar 2026
 12:05:04 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 14 Mar 2026 13:05:17 +0100
Subject: [PATCH v5 07/10] arm64: dts: lx2160a: complete pinmux for rcwsr12
 configuration word
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-lx2160-sd-cd-v5-7-83de721585e3@solid-run.com>
References: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
In-Reply-To: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::19) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM7PR04MB6805:EE_|AMS0EPF000001AE:EE_|AM9PR04MB8618:EE_
X-MS-Office365-Filtering-Correlation-Id: 9274f318-5a12-467c-2fec-08de81c2021d
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original: fZ0TXn62ydAOwKMAuH7I8tl18HllACLpBp+AD8cIFIo2WY0d1jVIyqa6xOjY9mY4K7dxxgY7kPc9KXCs3Y6rhne1AZdvTua5/Rnl5/YCrl/nTU7jJn5lrNlXe7IloSqv346tWSGBBVcglztEOCeSfybRm0ytwkzFjdgYPj4XMimAHiXq7rv0HTEwrcdjsuryZXAPRXuWkZbP7lV+C21eymu7UzQ5jtf/vWxQVFeZr07fYJDYy9vBup/ZdN4NU1ZwZEmHcnQMpSERrs+zKoyWrk1vQyOuBqDR5LpPP86rN5Hz0p5QmPn5At/rPA16vRSmnlJLc9mYegpwY2HVfZ2qYnjsKWXC14iOkMqivfkO6FfAJuAcVOsTDpqgMSs9sP14VOul6zsndRhRVURS5+vnYY2iVwd4CvGRxjABCvoWDdp6tlMpvlsAfnAvD7Ifh0I6IyKDNfjAig/MX55V0eUrllmjLrqDKuywXDDcz949Y1pMDr2GFopCYEnCqWlCBOrKt+nVmyJuiRCBUaDpzNq6bU9jidXd9qce+cxHGXWojIe9EIHX6jxX0qCWK09PZJbbjwD5b4o78Rlr2Y2Tml5hkqhxDj6LQCqBMuXQSUAnIii16ctF4k3nI6NIYMga34WMJKeM9LIkNat9KJQrQPSVNV2O7ZtHUvDxpotsxVHMdDnylptOws4+MRIIQ4ZitBn+XWz++HbRV37LbXjzqkUn6AWLNXSPU4d2d2CgcaKIoksb0APoGx7kvfQTqJa3m3N0EIWDYxkmpGcxKdso7ZeTgQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: nGun1Rx0rRIe2dvP7RmQziPmikhhwb+lC7WC/VCsCVcMQ/UKsAzebF/cPwkQo96FFVazbScMTtEYurNUQLtNHkNQkcI1oUGT8xx9uqLbxk3qOm96p/HzozcO45phg86SkIlSL+W4Brrkl/y2jda44FNNMZ88A+ymZCllShRlmGvqRtdAAaZGRZAe9ClHPurOYSoub2uCKC7gQEDOBJGEssKcxFYCJKLLW3mZ+cFwS6Da1u9VLG6hp+KZaXilMVyvO4iAJ8JKQyGG2qG11FpA140AxhetcdJSwMuRaNo2a2b1ZxmDi3Yf2dOHPqUYKtaUpDsT4/us4/9ICxdbhxQdbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6805
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 26a50fb113ff494caafb3ba830a20a96:solidrun,office365_emails,sent,inline:e8a71b8ecf121745cfe4398c998083a7
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e8d35434-7ed4-43d5-33c0-08de81c1ed59
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: y6N3StmLvAoTmWbGqcuE8B7F7eLM+5vnyrU99vChI3JUBbWROxhifEM6Hbqz5zF90QRcEJWQNQA1R8odRaSz1Hz+raoBc26D+EMOAAd0SQ5oAdipurt2xVBq+IhbhxwGESJ3bFcuheLHXX1QKns18J0+f7QcllQKVUC97x0m1Jd17L/hm+tqawBgoENKGtaCPM1dvV+DJMeIcKk71vCO0hBHPsStI8t+9iN1r//3ldl9zt9rl6kyZ/zqkZUcs3xhk77Sn1lsDVk9u53ion7N5Elrd2T1R1MGTEWD+4ePk7fdibdJ2EdFO9Kk2hMoIAElW77JZvtghKHIVqpOQflIiCXBjXY0/RkrnyamyIyVCA0wobN98fBYLN8xa5yNBcH+CZSN3w76b6QuVSwfIGZSiv/bUKpiUL727gSAe5P3BQ0j0gchVinbSAINFDZKNoIqSAiRmz1V4WNLr9mX/g+nsu82z6TTcYHOAbC1SaAuYnCXTQxU076uNiOXIq9avJKsSAqPed4HmDJXNrQlAzO/D74LKGNLFUJNIFrczgfpfAuapb+nEJ2cb74wROTYKU9Va2/AdJb2oeMK/W7ehfe98qY+uiq3e2Hpbh4giYS81Pr0BE+xtQwWyrlW9jjTz51nv2nHJ8iwBEjDOKHPkK8mvLZOhr9hfGJYJSZCqWpUs8VTotATIANvPO40qLq9rE6WBeddkQy81szFqqCWK1gsYypo1ho0K+A3MiPCTDR4XMPGwUhTFqjJbkQKXRvBXK0oSZUbKjf/QjVpn2d2lYv3ug==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xK6oU0+htHjF7Qp7OmNxeGU4h9Z335P5aHUE/j7T+e0JbwAMTL2UYeH1Mv19Vk3i/sWc1b9vOkOLs+ugRNDFRgslhhXNZBQeb1iZu+EWDH8KgkoU2XLRgRetGewNdFj6fwqfselajV+ZThc9sdnwGmemXaWRwSb0qiyw3E86+Ucl5xyUVPE27V5TRuanCll5eEdD5QbpqQorBA2mEp4crc14pW68uhGOCTqyeRbSgukX/EMLshsmQ9F0FMqIE/edUpc6rxLxgqrV2E31xztEGInf1sCPcJgy4x+L6zOAj3qvwJyaFJNU2mXoA5FHGAFkU5K1JsMyKlhMNhGSTsVNFcjhwphZp5pxV6swjnURvQd9jQrygxmfEykKuAgerZpbF3CEVIAkIcwLDu7LaYj9BaWBTXkJsbMgqppDZFv5VRPBPbJ05/41+zmk36n62vg9
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:05:39.1276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9274f318-5a12-467c-2fec-08de81c2021d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8618
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_050544_433989_2F513176 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

Commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to
support bus recovery") introduced pinmux nodes for lx2160 i2c
interfaces, allowing runtime change between i2c and gpio functions
implementing bus recovery.

However, the dynamic configuration area (overwrite MUX) used by the
pinctrl-single driver initially reads as zero and does not reflect the
actual hardware state set by the Reset Configuration Word (RCW) at
power-on.

Because multiple groups of pins are configured from a single 32-bit
register, the first write from the pinctrl driver unintentionally clears
all other bits to zero.

Add description for all bits of RCWSR12 register, allowing boards to
explicitly define and restore their intended hardware state.

This includes i2c, gpio, flextimer, spi, can and sdhc functions.

Other configuration words, i.e. RCWSR13 & RCWSR14 may be added in the
future for boards setting non-zero values there.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 75 ++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index d266bf96e2c6a..479982948ee53 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1721,6 +1721,7 @@ pinmux_i2crv: pinmux@70010012c {
 			pinctrl-single,register-width = <32>;
 			pinctrl-single,function-mask = <0x7>;
 
+			/* RCWSR12 */
 			i2c1_pins: iic2-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 0x7>;
 			};
@@ -1729,6 +1730,10 @@ gpio0_31_30_pins: iic2-gpio-pins {
 				pinctrl-single,bits = <0x0 0x1 0x7>;
 			};
 
+			ftm0_ch10_pins: iic2-ftm-pins {
+				pinctrl-single,bits = <0x0 0x2 0x7>;
+			};
+
 			esdhc0_cd_wp_pins: iic2-sdhc-pins {
 				pinctrl-single,bits = <0x0 0x6 0x7>;
 			};
@@ -1741,6 +1746,14 @@ gpio0_29_28_pins: iic3-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 3) (0x7 << 3)>;
 			};
 
+			can0_pins: iic3-can-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 3) (0x7 << 3)>;
+			};
+
+			event65_pins: iic3-event-pins {
+				pinctrl-single,bits = <0x0 (0x6 << 3) (0x7 << 3)>;
+			};
+
 			i2c3_pins: iic4-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 6)>;
 			};
@@ -1749,6 +1762,14 @@ gpio0_27_26_pins: iic4-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 6) (0x7 << 6)>;
 			};
 
+			can1_pins: iic4-can-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 6) (0x7 << 6)>;
+			};
+
+			event87_pins: iic4-event-pins {
+				pinctrl-single,bits = <0x0 (0x6 << 6) (0x7 << 6)>;
+			};
+
 			i2c4_pins: iic5-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 9)>;
 			};
@@ -1757,6 +1778,14 @@ gpio0_25_24_pins: iic5-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 9) (0x7 << 9)>;
 			};
 
+			esdhc0_clksync_pins: iic5-sdhc-clk-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 9) (0x7 << 9)>;
+			};
+
+			dspi2_miso_mosi_pins: iic5-spi3-pins {
+				pinctrl-single,bits = <0x3 (0x2 << 9) (0x7 << 9)>;
+			};
+
 			i2c5_pins: iic6-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 12)>;
 			};
@@ -1765,26 +1794,71 @@ gpio0_23_22_pins: iic6-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 12) (0x7 << 12)>;
 			};
 
+			esdhc1_clksync_pins: iic6-sdhc-clk-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 12) (0x7 << 12)>;
+			};
+
 			fspi_data74_pins: xspi1-data74-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 15)>;
 			};
 
+			gpio1_31_28_pins: xspi1-data74-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 15)>;
+			};
+
 			fspi_data30_pins: xspi1-data30-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 18)>;
 			};
 
+			gpio1_27_24_pins: xspi1-data30-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 18)>;
+			};
+
 			fspi_dqs_sck_cs10_pins: xspi1-base-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 21)>;
 			};
 
+			gpio1_23_20_pins: xspi1-base-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 21)>;
+			};
+
 			esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 24)>;
 			};
 
+			gpio0_21_15_pins: sdhc1-base-gpio-pins {
+				pinctrl-single,bits = <0x0 (0x1 << 24) (0x7 << 24)>;
+			};
+
+			dspi0_pins: sdhc1-base-spi1-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_cmd_data30_clk_dspi2_cs0_pins: sdhc1-base-sdhc-spi3-pins {
+				pinctrl-single,bits = <0x0 (0x3 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_cmd_data30_clk_data4_pins: sdhc1-base-sdhc-data4-pins {
+				pinctrl-single,bits = <0x0 (0x4 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_dir_pins: sdhc1-dir-pins {
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 27)>;
+			};
+
 			gpio0_14_12_pins: sdhc1-dir-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 27) (0x7 << 27)>;
 			};
 
+			dspi2_cs31_pins: sdhc1-dir-spi3-pins {
+				pinctrl-single,bits = <0x0 (0x3 << 27) (0x7 << 27)>;
+			};
+
+			esdhc0_data75_pins: sdhc1-dir-sdhc-pins {
+				pinctrl-single,bits = <0x0 (0x4 << 27) (0x7 << 27)>;
+			};
+
+			/* RCWSR13 */
 			gpio1_18_15_pins: iic8-iic7-gpio-pins {
 				pinctrl-single,bits = <0x4 0x1 0x7>;
 			};
@@ -1793,6 +1867,7 @@ i2c6_i2c7_pins: iic8-iic7-i2c-pins {
 				pinctrl-single,bits = <0x4 0x2 0x7>;
 			};
 
+			/* RCWSR14 */
 			i2c0_pins: iic1-i2c-pins {
 				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
 			};

-- 
2.51.0


