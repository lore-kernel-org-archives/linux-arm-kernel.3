Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61C9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 15:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yNI+LhHXQ+9iO/YpWo0TJMuaZrrlbQ9uwKMkDKxFoOE=; b=ihXyaQaujwE+V1Zw+cVRpt7lus
	SDr8mrfzMrOWx2vsRPtzb9Pej8Pn1lAmUsQivsWD/6ig1bMXUTe1MzaFBpq+6/WNCamkLejb1pTGB
	bG2hXl71+4tkXGA+d9234Pc8uvcaKK/h3I+NT1nAIaHjsoJzmXnGxRpn4I02ppU/xCQvcVmxIY84d
	BUSvJMrEz6ZAZvDY2kREkBBg2NoZPc+B9qPdXNJlRJ9aR4+7h2XBri4DgHGhilgz1tGCEeBSgbZmC
	MjV/I73Q+91tzCt98Ry7EDId8KSjNktTTNoin7i6jM+7AkZjcbeGXE9GvYI1rL+I8eTyBgnPzY14A
	/4vyj8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiaWV-00000008opC-0HJq;
	Sun, 03 Aug 2025 15:21:19 +0000
Received: from mail-germanywestcentralazlp170120004.outbound.protection.outlook.com ([2a01:111:f403:c20c::4] helo=FR4P281CU032.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiaTu-00000008oVN-3vJM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 15:18:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o72/XnZ8FsI+gixCxKzI/PM27Aszxy+eOzEYVMrKQgbqxlpHH0G8mu4PR6Te5NEDTk4n+KCINHqaDadfJm9pLIyXOKAhGVqsUP2YBN3JiIu+YSjqNmYUKO12f7QrNOGpqInoK901FxNdlvBNo0jzMYsNpve7MEx7kPaaae/CKq2Zv2TL5Rc7+oxUl1dBXo3j641FauR0u1CTE7g+HVDoJpxWJfbh1/HSAHJ9XqUMEYPcRf4S8CHqG8ONkm3QzMLkFBOyvx1DL3m8ORNf4hTjX8tun2vkhKLPxijAvCF3wlkQXbwE2U2iVU31VadzxsZDXvVK2Hk2lueojBKky/QaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNI+LhHXQ+9iO/YpWo0TJMuaZrrlbQ9uwKMkDKxFoOE=;
 b=E748q4qT8c9sljWmBn5xKWi9XRANk7H9cbjS6PFI4dmUv9KZSpBQ1mjlvKf0td3K4higgSrrEFIFnTt015rtXRNW2MJhvYBnCANXFuyKmibkoGo6Z82He6piWBUJKLk6SaeXUAsmORHHy7XMIiMNBm8cL3kS5PjgWL1kj4zdu8DSjFe9K4KyvVVI5E87SaNsIzBDvibYbrvy4cQJtAU4j5AYFKL3LxWrb0rCo4Qlhbk66MmpqUAUaOxa+n1kwIKkqwwfRJQ2idULTai+yRtwgxr4gzT+cWrD7KiR/d6j4MtCOrla688NlyHZ1iF2mJpkHhrgbRXVGzklCZTHFbR9Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siewert.io; dmarc=pass action=none header.from=siewert.io;
 dkim=pass header.d=siewert.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siewert.io;
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::182)
 by FRYP281MB1898.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:45::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Sun, 3 Aug
 2025 15:18:27 +0000
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::32fc:c799:7f09:62b5]) by FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::32fc:c799:7f09:62b5%7]) with mapi id 15.20.8989.017; Sun, 3 Aug 2025
 15:18:27 +0000
From: Tan Siewert <tan@siewert.io>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Tan Siewert <tan@siewert.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: aspeed: Convert remaining ASRock systems to NVMEM layout syntax
Date: Sun,  3 Aug 2025 17:18:16 +0200
Message-ID: <20250803151822.68080-1-tan@siewert.io>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::11) To FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d18:2::182)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR3PPFB3D0CF1D2:EE_|FRYP281MB1898:EE_
X-MS-Office365-Filtering-Correlation-Id: cec67af5-5dea-4261-bc5b-08ddd2a0ff37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|52116014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ODEjxedArVCdiJVppkvG3HodoDcdaS5k0E8mm2klm8aTdK0h5nKCNh2RXxAA?=
 =?us-ascii?Q?RWuO8ANHaKOtTcVnHus3/gZnZmB3sNrrk9PdDX48Q0pN7M8qUTK2auBhrdUl?=
 =?us-ascii?Q?ovMD0e9ZooEjkgmzZeqhrVCO+eIJ6Zl7k4Pa2vLwrnwrD7ciJZQRAzLfmoZt?=
 =?us-ascii?Q?rRP7fzluarox6/aMRmkRO+K+HQNSdOFrj972hITHH7aE8643tZ8zt749ltv9?=
 =?us-ascii?Q?yq7FevL0lpSb6ay/oviDBNAy5lhrhN0EQj+3AHimsanxAyKnE80mE1xec8Ip?=
 =?us-ascii?Q?EiJZLghhBethISIKr+WjsDsvg8iSV4madC6u2sFEH4oFkgCsbu5rc89BfOjr?=
 =?us-ascii?Q?2M0aJmSFhOGjdGeNTr1tUveBnSYiSopxfa4NrUXeCeLojBxAUI48G4Hu9HE6?=
 =?us-ascii?Q?XNLyJ4Csyk09HiToIRaAZkVcmVbQ4CS8LOZetYRfgHVUknxfVuhNR2d2egF+?=
 =?us-ascii?Q?QPSrrj6jv12umDFx5e0UE8w/GKTrBr9cipM4b24NeLX0Xgpe4yhGhayiWCbH?=
 =?us-ascii?Q?MYmDYLZ0/f4qqR5511dCUbliHqj0rWOFCZUyLMvilzqVXbYftGAl67UYTT9b?=
 =?us-ascii?Q?ug5w8bX63p+MVGj6XJ5/PwsZc76mI/M1NlOwT1a8zBiv/Gs4FDNzsG5nGaHM?=
 =?us-ascii?Q?Jz4VYTeKhmfk/UURL+wDQVS1W7won8wij8MtTmuoX/NqLv7+ojGIorq6HOA4?=
 =?us-ascii?Q?W5iq8l+B+5SQlv/z8AOe3iCpleRaRq5uFE8EUlYzgkvJl9S6q7wCoTh4apOc?=
 =?us-ascii?Q?0KLCGB7vtbR/K9VxyVMVkrjiXuZdoUdbMS8mZATM16yLCMD7srOhrQdrRjRR?=
 =?us-ascii?Q?2vwVN+BFLC6856B/zuEXgO0rUPUzMkbcOeGMJYnfYMN9+Ay8DnIaNQr6va5l?=
 =?us-ascii?Q?6dzRf48DTKIIdIBrPbdxU9McM/AdflRK3Yux+osu5/qQVZAHf768tH9Cd9+H?=
 =?us-ascii?Q?htz2UGcdlvYyYjB74g0Mpfo0I0wlvEUss2V27j+enmEin9db7M6HkBK5hZar?=
 =?us-ascii?Q?hfvvD4XAJSu3b1LIQIA9g+kljjJEB/MGzD1KnFqKTp2qfxwAO1kF//cldkzo?=
 =?us-ascii?Q?wCtbB8lCyGE2AXkVYEWL0ev9BAORkDhT8FZcGG7k45ICOYpcMiNR8aqpB224?=
 =?us-ascii?Q?45I9lefV9uARonw3DYxyQ7WxYVF7Kl66O3PvnzUdvGWsMK/TgtYnYjbyZ/4y?=
 =?us-ascii?Q?LPg5l1fjK8zSJkCLgAy/+vX+aMttFw0l1OQlFgf+9GGFcrg+on3RjY2fhvP+?=
 =?us-ascii?Q?jjEvLDaJYxWsPLQjEIUF2JRs+H4HjpsKQDQ8nfWGKqWhCtJfn3YsKg8LESd0?=
 =?us-ascii?Q?KkrDOwgdSp+HpuBgYhX0xHyjM76Iu1qF8LgetCKP+7V5NR89mOLMIS2vG79P?=
 =?us-ascii?Q?xMkirCdLNzuOwwlEcpr6ixlSzL/zrXExRnHwbBhgKPSvdLKtQrHfzaBPfXXb?=
 =?us-ascii?Q?/MxYjtWytR8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(52116014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OHPT+ihqAu+7w1UsGhsfRlWDYjNAc3Zo+Qvm5sgwzc7n/DIfspXfAzs3jGDg?=
 =?us-ascii?Q?q63YA4FRVhoNVyUUZ1gbaIYZFexvjcs+GzDU7hO1zwrLfhlcHRVu5zGCUdCM?=
 =?us-ascii?Q?hvYLLdg5EKIbUIfZz2Af/DYHHDq0xiDq4FFN3FYATLmvZ6B0JFoTO3oyno+k?=
 =?us-ascii?Q?2qUYmyT0f8BzFEIQ4sp0XNusKakT2Q3rr4aUV1mkjftaNtfOGSBLnc94bkeI?=
 =?us-ascii?Q?pphw1YWWsKpb3UYMyCiK3km7n+g/zOaqGzaVBTeDwlxPSTU+PyuVlCFYYwMf?=
 =?us-ascii?Q?vVlEKRAuvi4h9WirNNPjphkpYxMP931FcELa2m1r8dkxUmCgiWAr9YkvRton?=
 =?us-ascii?Q?23kP91Tj6ZKyjQXCTzLZPubhmia9Uoox4+INe7P8IvSxsfpDNfgIw0qXuT7q?=
 =?us-ascii?Q?N5Z/CH8ZZ2hUD4QCmZq0wFISpcaM1E9mvZhIDUOm6OFALbzE8jj5GCcOFogk?=
 =?us-ascii?Q?zgcdKHmqKoO1i6WZKRuToBvjltfYTYlCODTYK0M/M5KUMgjpIKjILm83MbFk?=
 =?us-ascii?Q?UGZjrk8pQ/aGNFGRCfN0Yej1cxXQdzGq2f32iz754rSM+N404mfb5Fc5hoYI?=
 =?us-ascii?Q?okG33H8tSewEuRDUNbXmue14e5SKuAu7rCOoSt/m3id2JhfJ/S6YD1T+8Z5O?=
 =?us-ascii?Q?ofKPneXdyrhU1qMpg3v1ORzz0yNq4w0+1u2edBw5ZR2Zhuq5FqtmkJRAB+ht?=
 =?us-ascii?Q?nbtEMO+A4fyz3PHtSFGZqplc/WXjRe/jUS2zOc0xcgxM5CjEuCTIq4m2VI9B?=
 =?us-ascii?Q?btD9qicv+0xjCX9k3OFmummcmD6Qj8pffyN6rVNK82AS3OShcSJ+2YeHF7wC?=
 =?us-ascii?Q?yC0t4VBjCtGLde9uBXCE8DWb3uM+aEL9AqAlvMo5IuV8do1bZCD/JTVh7y6G?=
 =?us-ascii?Q?CqM4a2i+xKqmmfj6pxA37oid4aamq2P0/6l158hoBT/V0SOdiRRyuPzBenZ4?=
 =?us-ascii?Q?SR6CeSClq9UXtdGZiJMDjYWr3q/yJgHOBIAYoWP1CFwFY1BG+MLUehhNKAiZ?=
 =?us-ascii?Q?PMlnQs5swpnaKHM4LSrLsHZh7oD6wH8W7rnzXnM2rEje1TX3GhDwKlNQjO7U?=
 =?us-ascii?Q?BZ4sK8huO0IBZmdY31p/OPUOduC/2P13BJDoKiOcVZ1ZQnZkgrletLiQIRaF?=
 =?us-ascii?Q?kqoW7PVIC1R4OcePPLplauF7K9mr4YX/leQRzWW+W/U7ikEKfQX5QiCduJE8?=
 =?us-ascii?Q?MpWqIEv7tHal0eCf8meqAXvHrGkTrTlHLTzWwNoO7oodKFcASvjn3gwrC89d?=
 =?us-ascii?Q?OltJE91SifLsL+jlE7qLb0QOaOCV3ieCZbWEdYTli9kBQmCIuyTSkHYf4NfZ?=
 =?us-ascii?Q?zPlkVI1eAxdQh3/F9h4Qnlj7u5nPHyM0FtNoySS76x1Hvnb8GvHCqmoJthVt?=
 =?us-ascii?Q?NulGB2KWjrFl3cmAhYm1kNZxRtuav2ZWxCBClJ4fDjQyz7ueGV+gImUj84+b?=
 =?us-ascii?Q?gHGeZGXJegaSVt3GfLiP0ajhH4CYoV1Vy55aGdtbutzxwLuQsK0zlk9xWwnB?=
 =?us-ascii?Q?OGRhTDfFLVjJ22S2E5IwjoLIwO36jEite09ztoWY33B58xanQ4q+pA9DCuJd?=
 =?us-ascii?Q?cuR0MkuwLXMjg+/u2NKO7AqNfbStNFELj0ZRFSV7rxv2BxdQltR8y/wyvZ1b?=
 =?us-ascii?Q?5QBkAveX+Xrz4Bio6mvXcDE=3D?=
X-OriginatorOrg: siewert.io
X-MS-Exchange-CrossTenant-Network-Message-Id: cec67af5-5dea-4261-bc5b-08ddd2a0ff37
X-MS-Exchange-CrossTenant-AuthSource: FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 15:18:27.6464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e8b4abbe-444b-4835-b8fd-87ac97451a7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNbW2yv+qwpIGGVLTyLxz7Bq2ZPaMWcJq60+uc/glnQAaMtgdUT9VEP8ZLUZB3l6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB1898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_081838_975763_3BB1BDF6 
X-CRM114-Status: UNSURE (   9.58  )
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

Hi,

While investigating an issue with an ASRock Rack platform, I noticed
that most of the ASPEED device trees using NVMEM cells to populate
MAC addresses still rely on a deprecated NVMEM binding syntax.
As a result, the MAC addresses are not populated from the
device tree/NVMEM cells properly, and an address from "the chip" is
being used instead.

Commit 76c5533925434 ("ARM: dts: aspeed: convert ASRock SPC621D8HM3
NVMEM content to layout syntax") was the only system that had previously
been converted to the new layout syntax.

This patch series converts all remaining ASRock Rack systems in the ASPEED
device trees to use the new NVMEM layout syntax.

Tan Siewert (4):
  ARM: dts: aspeed: e3c246d4i: convert NVMEM content to layout syntax
  ARM: dts: aspeed: e3c256d4i: convert NVMEM content to layout syntax
  ARM: dts: aspeed: romed8hm3: convert NVMEM content to layout syntax
  ARM: dts: aspeed: x570d4u: convert NVMEM content to layout syntax

 .../dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dts | 12 ++++++++----
 .../dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts | 12 ++++++++----
 .../dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts | 12 ++++++++----
 .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts   | 18 +++++++++++-------
 4 files changed, 35 insertions(+), 19 deletions(-)

-- 
2.43.0


