Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB45FCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69xx6qz+Fz6uwgAuy3UmiOoT5pVSbJs2VgVxfeqThgQ=; b=n0OCv+WczbqCuXLaMGYw5rvVC1
	wYMJj/Z1irh4FKdaKQfhJbkDZFWgADj8T+8qlEncI+l+U3VoKAt6zHtOB/hv9BO97HmdDfjCXIeww
	Y8qDdcOdDd8gi+OBWARwFStnCX1S37NZ7V5eqgiW6iIta9vrWUTpygCjD7asFokQMb0MxgAseO2Pu
	yCGqYZUq2rsXae7m6GCBhBgi5gXrHYGuJXcrW4nvZhTx0STtni7TXE7wVonbbxXtKvbSsc6FCW3M1
	eHQbGnKQsgGZL4Exy68mpmK3t1GYvRsixuRFQ4xvdhkUZxZde98py53HnCxao8vRg3n1Kx7Q0Kn0I
	8xG/p+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEyK-0000000AQLu-48bt;
	Mon, 12 Oct 2026 12:17:40 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEyJ-0000000AQL9-1hwQ;
	Mon, 12 Oct 2026 12:17:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKtUkAIiu0qkIY2dCgKw+C8mJMmwPPXCJSFLV8mHQ7Q0nYz70yPHX0aaH9nGekYn/pAS+4fGtNYEwMLFEw1ytBxm4cwa4vtwVEcZGkoPslTPPct1ZpbgpDaqyt+WStbYhd5utf8tQOmvwPzgUFrjWSagmakeSApP5wJjiA8YjF6Z5DFWCkY7AhX9mAupmVZlGr8Glk72ZeYhS87G1fQuh05GYErwryhkVhSUcQz8x0TzJVI3uuwcZm7iKJNk9/8w0GSPZ9ZYpe9uq41vilNMTaZqXQId27zjWlaufAqvZyV0tCViavr05F62exfsXg4Ofkdmtw1mvr78u4RCIpAqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69xx6qz+Fz6uwgAuy3UmiOoT5pVSbJs2VgVxfeqThgQ=;
 b=fNg6Ob85qIMFN7BQ3TylIAXDBKdeMgWJpv8jFEBhGlvjhcs/SAu/nAIlmHL61uSMUERMF+AQYdj8rvFW2YACtkmeoE/WxBe2To9RkRbPybRYmQ64tRp1Qq9XnGAKdnUVm5QysgAnjnIl8ZuDUE9G53fj+Nccgvs8WShNKab+UbgUmFzMo0wS74knY1Ny3lO5dZRw5R2J7JZneyeV8L8LUwp0se+KsokD7+Kzuo3ocKZI4g+JJZgJ4ycHzQ7sG2IIUtfDKFH9eA8yu2AyhkTJGScL6n0Yn7yEgBaQoxfUzKMLh9NLpLHxy0ig3LLo1RJm1F///q2LLJXimqa1ZZ4aiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69xx6qz+Fz6uwgAuy3UmiOoT5pVSbJs2VgVxfeqThgQ=;
 b=LlVsmKPcDXVOhNrVViaGhMZ7PReD+FIqzYFBdI6gB9pvjB+Advn9Gu+s1rm23237MmD+j1tmqEN6HLNMnU4FCpgoPY6JbHMhlZww/2kJgeL1TcR/lfcw31aDSInhyr9yJ9C9N3XI5Ze/96v3M5+ZdNYqU7CPUzvkX7gyJ74t+X664SsqCdp6JJNlzj+SoALn/OnN7KSzoUn23PQ19of7K/XvgF6W26xG5lvaqN40g96rjOXVajREdBGZ2eyyZWzmKvqifr1JpZxWwsc48aNjWxOrl20YWWJT3SUV0kw1F/br2FoUhg/s+x/35ymxr8YntMGtphQCIVcG2HuNnSr0bw==
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:8d::16) by TY2PPF1753F85B8.apcprd01.prod.exchangelabs.com
 (2603:1096:408::389) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:17:05 +0000
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a]) by KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:17:05 +0000
From: Miotsuki Mizuno <founder@crepuse.com>
To: "heiko@sntech.de" <heiko@sntech.de>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "robh@kernel.org" <robh@kernel.org>
Subject: [PATCH v2 1/1] arm64: dts: rockchip: Enable I2C2 on UNIHIKER M10 V1.2
Thread-Topic: [PATCH v2 1/1] arm64: dts: rockchip: Enable I2C2 on UNIHIKER M10
 V1.2
Thread-Index: AQHdWkOYIeuT+ffYo0GYXTePiBmiMQ==
Date: Mon, 12 Oct 2026 12:17:05 +0000
Message-ID: <20261012121701.53360-2-founder@crepuse.com>
References: <20261012121701.53360-1-founder@crepuse.com>
In-Reply-To: <20261012121701.53360-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR01MB8186:EE_|TY2PPF1753F85B8:EE_
x-ms-office365-filtering-correlation-id: 16ef3769-9324-42d6-22e2-08df285abaaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: Cb5XK8IKfpFr78qhMljkv7OKUa89CKlQeQT22rXKsG/8l4lyHbqEpYsX9GaPDsD9AbdmqVICF/SQu27aHjqBOg1hkYBsED0MUSkYvMQpkhQThFzr1bJnvpGd2LIGaKzkHMNdGQ8OszfbAiPg2rjIx43jY0/PTjKX1RFqMv6hfMfeVlvVcEGoS1xNOInUnEK2ulTWuQPKpw8Me/wkKqxnYmyx+FutLj5ZkL3hNuZ0WvJJeT5jNce3Dz5SzTJI0fdXM3LcgIr2i5TteAYQaWSSuHpFj1c0advDT3TFriUev6hudJ4ppGXcAeOo8pbikU1TKBF70hxxaRQQevVG1ETTTfn1gU1hU0AI2lqe9HMXf3t7+pDouV9XAwfxZ1+82F6V1IaTo1zsGHppwm++hZkkG90RBwe5LcIASARKo9q6ljuVo8o27S5OqWiGVR6dtfYq5Izz9gNjnghSVFjW0dLvCEVBfctBdYTC7SredKyUD62EjYojaL0uYokthX9029NWrERhXsFv0tGX/Lo/x4I4q8t0U/ycsct7cyw63Nb1oOoUnU17zqoXNcjslBADrkKfHM5UqgcV87jzZU0NVsh/QZfJd4TuQNCmIlS6tchYml7buVmHV0+gbFFeehqylMhSeqP9a+95ksXmWkXnx10Nh3GV5/PXVQOWxYzu/fPvBltTfOj/YewykBRQ9xXTn/vARJeQsxfnhq5vDP/BRC20dQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR01MB8186.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GEOEqcjhn00y0bmoVpRR+bD+NVZCBamkPtMQYnTcnDUMHSNVO5hacL/J9E?=
 =?iso-8859-1?Q?tm7ve8LsmT8+KEJGmLOB46xA5oxfGPticEwO0QLmqWmX9ZzyiaYH3wVvoO?=
 =?iso-8859-1?Q?M6Apr8X0exXzCyEKSOOYP2fEnY2IpXK8sZQyd1D1bDjK3HwaKs+tbInuC3?=
 =?iso-8859-1?Q?+cTjnxw00ASpukTT9v8pdEhfyiZplu0D5AFUoRoU8DrEff8bs8KpqI5o2O?=
 =?iso-8859-1?Q?YJIR7fMW1P5zRTrWuvMOn9cokFyU9btaQEgxXzXOjouKWPejYiEsyxsjsd?=
 =?iso-8859-1?Q?AQPP/nxTkxKxozM03HpYwqkY0h/hiTD6k4fI5DiHa/UtFBdYWU9JXME8Nf?=
 =?iso-8859-1?Q?rsGNQ5M1Sm/cHLgWCf6jRFhP9vp6jkVdcfyYKvNqSgY6PtIehSAB4JL58l?=
 =?iso-8859-1?Q?NSc0vC+hsEqk9Th2oQH8ScpuAeIO9a2VZuQ6yM5TZrKp3+Ns2I8jvV5RhY?=
 =?iso-8859-1?Q?dxrcKPjzSgMG5PXQVI9/tM5U4uLxyNU4jGF33gKuAYdRSD9vnA9aeFy2w2?=
 =?iso-8859-1?Q?COoKAK3Jzi9WNv3nk+yGCa9r204bh4s+iOQsnp465MXzSepa0OvNi+oCTi?=
 =?iso-8859-1?Q?kI28VKla+J3jlP+SrkSwOYvvuZLxG0MlteG2yPUXIOhLf8zUmRUUwHOBnd?=
 =?iso-8859-1?Q?ZaAbBGmkguYZimBAwzjtt5TdFdVEIxN7UgVxFgWQd+xGHYE/KQXdolb4nv?=
 =?iso-8859-1?Q?3nNVzZXMESwjuAJK1+sw4BjpJOIyZ5lJkT9U14BHmMsFpJXCkaeGYOXsWD?=
 =?iso-8859-1?Q?HzJAY361A7uxtIXohTbBpndswgAn+GP3ZrrpZhzhJuefKJRtS8wNMyVV17?=
 =?iso-8859-1?Q?zCqjVQuIZF9mnJZrh6NtKkwjF/rd9962TgU7wjWBFvivJexyaGTOxSVt/k?=
 =?iso-8859-1?Q?Y55slxHLCTcVmZovwO7n0YnN5Iy7J3jvPGuXpbA75EHICWlZt97kSkwH+u?=
 =?iso-8859-1?Q?6VYeUGMwd0bDAa75x1tv3uNJOJ5zzz1TKJEyEzDGslEm6ogzIc9LYN1Vnm?=
 =?iso-8859-1?Q?bywy8TnbPjqsDFYp6w2NtRxWfSfs1rp6M3vOgoj8yILKQEaKwSDfyk4taQ?=
 =?iso-8859-1?Q?VANzNppU+2MTPJcSPH5Q7UQwbNiUU1WXK2Gm0F5dj+LlEv+yskcWFUYHMJ?=
 =?iso-8859-1?Q?XXYe148zgwYsQ2IDgg/fiHnvjE1ASegdHQiNmzh03NCP/BdG53C6RCpYcb?=
 =?iso-8859-1?Q?AnzeZLPAP+WpcSH6sHasyLcvqeQbYFfGDsGwhNj/q49WfzCwxzYT/MpPaX?=
 =?iso-8859-1?Q?xOBoQvWk7T0tPdXa76WCZRTJomWNCIkIAUs8U119TvbQFAG2FwanXF6A0Q?=
 =?iso-8859-1?Q?wcTrHicLFk/m/UyO5anUfygBz08WGf0hssSsW/Ykt/yvs8aVZIEpcQnVpv?=
 =?iso-8859-1?Q?/Oe8r6EFuQrc43YhfHn79wRQOwOomQUNfshQXIaT3Zm4jxhTEMLN3W2BXA?=
 =?iso-8859-1?Q?YMsefyMeG/X2CS9mL0w/whD+GKWDdxBiAIe1vaTxw0//FvvR/j6IBx/NYT?=
 =?iso-8859-1?Q?TNiXt7gPv2GyiIGIf20rKDnl9m1LWrFwRT58r8I9DBc6TgP+TB8lo9whYG?=
 =?iso-8859-1?Q?iJEjj0zpk/wXkvvVzYRSQxknrCUMEfGK0BaCfB3cvuJhA2/feCgBTuQMhA?=
 =?iso-8859-1?Q?wqdlpmOn9CyL3KMFEFoONRuovqrPYim+3aZfNfDE8QjnORO/imiu2vtH/l?=
 =?iso-8859-1?Q?B9NMYZjQvRTCI8MmowJJTKFB1DzcGBn7IG98hTdfWdL3daGFByb7aAJQ0X?=
 =?iso-8859-1?Q?3Evhxg3blzzG9+gVfIYPXoJRIwRbeqCSugu9VWS0spFLwt?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: crepuse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR01MB8186.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ef3769-9324-42d6-22e2-08df285abaaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 12:17:05.3243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xdag43Yx2mBK6nH4N9HTQkyR20bEr0ZLDRpx9CCuRWTB+raSmY9cZLfULRq+hPgbNwEnuD+68/4r3FLM99wi6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF1753F85B8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_051739_496336_136022EC 
X-CRM114-Status: UNSURE (   7.32  )
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

From: Mizuno Miotsuki <founder@crepuse.com>=0A=
=0A=
The onboard resistive touchscreen controller is connected to I2C2.=0A=
Enable the controller at the tested 400 kHz bus frequency. Its GPIO2_A2=0A=
and GPIO2_A3 pinmux is provided by rk3308.dtsi.=0A=
=0A=
Keep the bus enablement separate from the touchscreen device node so=0A=
it can be reviewed without depending on the pending NS2009 binding=0A=
and driver. The controller-only configuration was booted on M10 V1.2=0A=
with no NS2009 device instantiated.=0A=
=0A=
Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>=0A=
---=0A=
 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 5 +++++=0A=
 1 file changed, 5 insertions(+)=0A=
=0A=
diff --git a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
index 270ea970c95a..0c03f118378a 100644=0A=
--- a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
+++ b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
@@ -131,6 +131,11 @@ &emmc {=0A=
 	status =3D "okay";=0A=
 };=0A=
 =0A=
+&i2c2 {=0A=
+	clock-frequency =3D <400000>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
 &io_domains {=0A=
 	vccio0-supply =3D <&vcc_io>;=0A=
 	vccio1-supply =3D <&vcc_io>;=0A=
-- =0A=
2.56.0=0A=
=0A=

