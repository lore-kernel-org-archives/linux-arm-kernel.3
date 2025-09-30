Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB555CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 21:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lKhkkLoqYIxMrEarQi++c2fS69G3baXScve4HZcfH88=; b=cDGA+R8P/Shb3GtyWHY4g1ltdo
	/L89kThv6QQJ3rar7gy+YZy0JHHhecGyPqZ8d+2QjW3JWEbf+FapmFxT8BSGjat1G+aV9ZnQow6Gv
	EotKOljTGwUoMlJtnPZi4sGKnWbxXJ8gp7VRW3L7Iu8BekEREWH3TNdmzG34IBteEbMABdrirxhsI
	qlQ/pbEyjhh1GjfWEZeQzXsvfhdR06aCV9rqIo64MMs+T8qQlaKT+yG9r6K2JLu7j2B3OSUzP0aq6
	hGK7NPyvcGO2dYFXYWWxJ8JVoWoyUSbWSYlgJxQ8Rvibbbeg2tZiufhXZH+F2eFl3JdNFz7ctSCeq
	GwBwUtjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3hdl-00000006F9E-3n72;
	Tue, 30 Sep 2025 21:12:05 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3hdj-00000006F8H-37SX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 21:12:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6DeqXPkbXIw6HVHnKteuPiK3wxCesEgQMdGaatyY/YEqec0Jg5EmYtIaiL7pON8ndzH/MqB2mzs00u5cYYSJsKScvD05vzslXl3svv612XWT21288IzO7JvTEwS+eYl/wwI3fvb9/XRT1v++IiUTKddoen6mz0PUchFZga+bwmyQhSkFtOnpFVCSShjS0WDYEfiHwuy/TXFgXKC69Hy3Kkild6AGV8SBLp4DHY1KqaNBETg4F8KAC8vpNgSID5I+kGqgDW6FeDwS0JL0vJd8FHjWkGffwh1JZGMeF1scjpYgxUo/cooq0+TbIxVqoZ+prcUqQfGdd9+UatxakgDzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKhkkLoqYIxMrEarQi++c2fS69G3baXScve4HZcfH88=;
 b=jN5InhORbB5hSI7KDhoyQwnhXKMA05Lf8VAjzZFnF0xZ+ZTMnvVr075TKKnzT4TN//Rg4RHeQSzRMn5sQp6eZzuQenaU0+9ietQ6eoAKRRJ8HYSr+9djr4smPeVlrU29X6MO/YZ4LzobsKsVPUppwx5XRaxr3LFe7OmCO3lXhGPtxnfk8BkValWq22LZb1DGLi0yXfOTooCWIAWfJw899XcnnXM+E/oGu6Ui/ddIXmDAIzEoJgB8rCDMg00comXjZLu6I5SLiAq6PiCIXEXLLEqfJP81F1uqbjjhdrCZg8/t71L1Nh/WGLL/DRo9amLoPmJOonIpea99ZgBg34bs4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKhkkLoqYIxMrEarQi++c2fS69G3baXScve4HZcfH88=;
 b=RDG4kKcmJzyf2OtDctYnaXyOZCabjn5QelK4Ju/TN+lR4wiSm+Vz0ggsUYl93u8q2hY0Kvgkgyg7uNRr7en5rr3WK/E9MC2HUVIVRhli5LRhvXFygIFATlVww9mAyEDSUIVpNNkh3IqWxm8gfrnXGRQ2kK2MJP+WBCPE1Z3Kn0W9hW9dX9S4Zwa2B8DBEUs23yAAV5Xi+iEY2LNpuU+MioA/MICnmNKzal8CcDYWAXBmwKXPCfjBJVsq9qmFj/nsFa8sBZZ31WJvhhQu8cA4zhQ5nuN+R92/TUNiyPFnnfGcBg6OspbtD+MqYwz/lNcPPUXkNF0ohSKGcgZApVx04g==
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7621.eurprd03.prod.outlook.com
 (2603:10a6:20b:345::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 21:11:55 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 21:11:54 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Marc Zyngier <maz@kernel.org>, Dmytro Terletskyi
	<Dmytro_Terletskyi@epam.com>
Subject: KVM: Nested VGIC emulation leads to infinite IRQ exceptions
Thread-Topic: KVM: Nested VGIC emulation leads to infinite IRQ exceptions
Thread-Index: AQHcMk7Yj++4l3leA0uVFgouU6YiFg==
Date: Tue, 30 Sep 2025 21:11:54 +0000
Message-ID: <87bjmrprvq.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7621:EE_
x-ms-office365-filtering-correlation-id: 42d16c7a-0e8e-4c6d-7229-08de0065fba6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?X3De5CeN5PJj/SNKDslWFPkQKKqypalPAv55wIvRPgjwpCPy8yJhlLGHgm?=
 =?iso-8859-1?Q?Q1ywYIouuwiB1C8Mif7jr2ip6M/tn+1iXCa0eSNRIWybmA7URfHimfOJZ8?=
 =?iso-8859-1?Q?17MA/JlmlYQmGM194vRtjo2J6YlxxHKE6lXphGRNlfoeL/tB0iAc4aovE4?=
 =?iso-8859-1?Q?5ewFIDyIqQMxtNYFBHy6Kx222Va+oT/xiVfSaxeb8pi1Ece2wM73EWZ/vk?=
 =?iso-8859-1?Q?9c1dHGVBO8EJ/zUbgauNlBBZv95CWUq9AmCkgyXqQC2fuwwOU7/U7s+pag?=
 =?iso-8859-1?Q?5N2tL/XS2vSiOxUT1u4gVxgNrqlfdnTNsiEw5iTix5wzUC5e3dzU+cIaaM?=
 =?iso-8859-1?Q?Sp2JEMziH+pJvFnV2axboHsb8zI0QqHf8DxnveAjP1V26RUr1Xg/Pi0Khx?=
 =?iso-8859-1?Q?hJHv/4SjqJ8BI0k1aX7901mPusnOLzfFzKbpd30P9/NcMSLn4tdBsX7Gom?=
 =?iso-8859-1?Q?CRRecFkXJqFaJ+DaBhfI8sEoP3yNvN2Lvwzvfi4FRFz6HklmpCDAs3cHym?=
 =?iso-8859-1?Q?kIcvr2+nE2qcrZh0kGzTiwcxzPtrFSnCHZvzD3xIXI2Wr0Rp84inD+ZSjB?=
 =?iso-8859-1?Q?ig1l/q/VJ6baEDek57jrHX2dwsez+rXOavAOwMMebHFo4wWx2XXXJ58Irx?=
 =?iso-8859-1?Q?3Uqq51sw977kZkFWiEmqCgNDZzbvSkSPk4cvuSp/huU+X+jABY2CIqjLXT?=
 =?iso-8859-1?Q?2rNI9Gw2/D/ZsZf9NJtmkDtSljKTcWcMOPdqkpaPNtOCYBv/UzfpbENxX0?=
 =?iso-8859-1?Q?6bSm0baztINhz9cqjvHuh/XbhfRBZ3GE2NwpfPmzcfI2oGHqEb03Y8GyhK?=
 =?iso-8859-1?Q?024KyJd4tqFyn7JUNv/X8HrBSh9gh+5WVSsqNZlo5EOCwa09UdSioRXjcp?=
 =?iso-8859-1?Q?JxkXtZgh13sQAef5nHnQd7OtyX1E5g8gIIZ+DitW5+ZIFcLrErlGEFY0Es?=
 =?iso-8859-1?Q?jEIp239CeMCjzPSHgDlnV9lZ1PW4Aneb3CDe0qwgLDHasUzH4JEtkliry8?=
 =?iso-8859-1?Q?DZBIAArAN3a5lmw1kNdsMhqA1Cer77fR8b17Gsycd8tElFWgoSaNtPjH0X?=
 =?iso-8859-1?Q?TtpUUZA7YBOPRl1wTeE25tYdnf7tivb0DazMySzEWL6QDaDvsM/C2bi2h1?=
 =?iso-8859-1?Q?MqgxyOM+/rcSiRBvTLH2vEBB3zQ/xL7EBuWznF6fw2nwHEwmDYi9KYXVWL?=
 =?iso-8859-1?Q?7Gl83ycP8twf8St2ZLKzGbWflq5D6g9j/YbtXpHqKZfJhjo4yqnjPMwj8o?=
 =?iso-8859-1?Q?9svRBQ2D5HMuUkTgwgVbMTKYue808QBXHShQy/G7cfQ+C/OP6W95RG57x7?=
 =?iso-8859-1?Q?OEovpTpfp42oqX2K8eLX4tH+7/Xt579WfXWt7aW/PjjIMI7fJhvLAemLyl?=
 =?iso-8859-1?Q?nXnTpmsa6ZGSxOYWbhOzMTToesXiijr9aZvyiAhcNGBd2Njx5cvE9+Hs0l?=
 =?iso-8859-1?Q?Ro7nHWrAKLy/358VnscTZWnvNDRFzQ1Y87oDu9DEgB6nPK6Urv62dDA67l?=
 =?iso-8859-1?Q?/DoKlJAdBVga7Ym+7YDCCEyCCk9OTDzCzpjqLn9f8eqpz9/y2CJvjo0b9f?=
 =?iso-8859-1?Q?XDJSeGK5bTcpxP/Q5TOGwb782iXW?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?k7mJt3O1CfRamC0WoNiT/RRtrQUh4Z4DgPhgjpah0PKKe5biecFoUcMJc8?=
 =?iso-8859-1?Q?9dvEGzwMChQVrsCZm5sOrkUa4eig9S/Nd4KN5m59zwQ1B5MUsFZW3V4aaB?=
 =?iso-8859-1?Q?Vd15XjsByiNZYTrBREiJFH8maQkr+RS+eWQmD9Xxfvjpj2s8S3OePEA0pI?=
 =?iso-8859-1?Q?4aYB9CRc6itLlRB92pvGpuI46bpNspXLjQjuKOtU6zI2WQt5l3uj/0IkgJ?=
 =?iso-8859-1?Q?qzqFMmzizC/Fy9NCaI550JU93oynfJlBqQSsvF6MUZDdgnCBNH7HLb49d2?=
 =?iso-8859-1?Q?h88x7h8J/TcEhYzSdWJvq8C6wksfzGyhMKMwq46xvhP0LrnDx9ioL4Qpx6?=
 =?iso-8859-1?Q?O+mczqjppJIyzX/TPbRk5wJ/01aO2eArP+aJ3p9du95cWQDv8MFJL0nlUI?=
 =?iso-8859-1?Q?8X82td3qx2RYPO39hkMlQAOViXjn1hdW/2V8cRxLA7yTahGcSXO3804GNS?=
 =?iso-8859-1?Q?wQoJ/jT7L7KKyYPk7P8RFwMMx+7N0PGvfdfAIuNSORUGNlPJGcFO8mdUWU?=
 =?iso-8859-1?Q?QeQJyeOfEEYZ99NlvFV+4M8H+manhjydez6QvnFR5H3KPJSrIvkw1Hqifq?=
 =?iso-8859-1?Q?iyNPRzDNoZF2qta4w4uCNf6HjERQ+Ywq1J8Ok/nvNZKDLIytnEszzid8Au?=
 =?iso-8859-1?Q?sVIOnShDk08ibCVuRJk9admlCttxtTgBRgp5EB6Kf6dE04hXLKPvNpY4gy?=
 =?iso-8859-1?Q?U7fX4D8CJyObKuBEpay6hpNzy5IVqxdpL4UESsO4Qey+H2/9dJtL36+mJa?=
 =?iso-8859-1?Q?fOQnE1ENyRkIS5c++kYvbv9UUrzKzCM3ayb3Efl3GP3Cx/o+6Or0/ceGf0?=
 =?iso-8859-1?Q?4yLjdwAJPj4DdM2HL4uNs5vkg0rS/A+Cfc5p4NGaoMld9gX/kXgCDkCOHN?=
 =?iso-8859-1?Q?Au3VQree3GXRZ3FbkaoF92yDn4fx5piK8PlxHq6SHoypabwpymuWep93Cv?=
 =?iso-8859-1?Q?38mSKXk4W9rQC0ZAgXze/HgWAXqDZ8e8UYCDc7iBIPqak4gAHiDV4AHraG?=
 =?iso-8859-1?Q?84n54/xyEczn3TSoyHq96sBsti8eWIjPOGD9gFC36G/fZW/ygI5oXbjoT4?=
 =?iso-8859-1?Q?U1p/R38x0PGsTJjO6Ag/YFOXt4ydE8T8CD4MCl7yMMh/IFD3lC3vxcRX2i?=
 =?iso-8859-1?Q?tKtslctwZZW7P6dSrAs3kvgH/WG1H1euYlxoZu8/U9oUBGZ26PbIunzZU8?=
 =?iso-8859-1?Q?Ga8U+fh9rbRF+appdAkqNEF7iZPle+quKw4K3+FBbifVUiHdmfKyRv/Rsa?=
 =?iso-8859-1?Q?XAiwGDNDBduKi8ikD/Yu4k7kErsNvIL1l4kXVJQvRFIU/+GxfAV75OFbsg?=
 =?iso-8859-1?Q?C1Z/JDclDuW62VXApQ3B6s7R9Zsm4G6uI878JCA2IObfbtm13lGSgc0BOw?=
 =?iso-8859-1?Q?5al+2/mAte2EWG9RpMhrsjseslGEh/omyg/aXZZbaARr7h5OFepk7dmiIJ?=
 =?iso-8859-1?Q?9eeXzDGdozzNtPqaKJDj0k7AZtdjKKcKZxafryVtwJ7OdkAFJleJGonwjG?=
 =?iso-8859-1?Q?GaTSNfUSdZPlE+CD7stUqNjiwim0fElAuZnoKDoCmV5XujZO1Md5HY3Zne?=
 =?iso-8859-1?Q?pFlR1g/nvoa3KCAIDNHN6rJUWoQSUnRyMntYMmeQJbbKS+lSTCwLQc8Lus?=
 =?iso-8859-1?Q?dwLSUQC+iXHSaJxLVV37cY3hixsqa4gp7AiUI7zr+rqG2wnpuJmPsrMg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d16c7a-0e8e-4c6d-7229-08de0065fba6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 21:11:54.6573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilVsveI5W9rPuzARwrgfbZ9ab/f8VBc5CxKUgDNaCxNP4Q/SA7j7jAwQ/zncnAOYoFCQd9A+loaM11TropBIqams65jJCPTeX/e0aveMA0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_141203_952051_AFE2602E 
X-CRM114-Status: GOOD (  12.23  )
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


Hi all,

We are trying to run Xen as KVM nested hypervisor (again!) and we have
encountered strange issue with GIC nested emulation. I am certain that
we'll dig to the root cause, but probably someone on the ML will save us
a couple of days of debugging by providing with some insights.

So, setup is following: QEMU 9.2 is running Xen 4.20 with KVM (latest
Linux master branch) as accelerator. QEMU provides a couple of virtio
devices to the VM and some of these device are passed thought to DomU
(we had to hook these devices to vSMMU, but this is another
story). Sometimes we observe the following sequence of events:

1. DomU gets IRQ from a virtio device
2. DomU acknowledges the IRQ by reading IAR1 register
3. DomU is unable to deactivate the IRQ (there is no write to the
   EOI register)

We are not sure why this happens, but our current theory is that DomU's
vvcpu0 is interrupted during handling of the IRQ by Xen's timer
interrupt. Also, we are not able to catch this specific moment in KVM
trace because of lots of lost events. Anyways, after this we are seeing
the following loop:

4. vCPU switches to Xen via IRQ Exception
5. Xen reads IAR1 to get IRQ nr, but gets 1023 (aka no IRQs)
6. Xen issues ERET to return back to guest
7. GOTO 4.

This basically renders the whole vCPU stuck. Also we noticed that DomU's
vvCPU is stuck right after accessing virtio mmio register. So looks like
this is what happens:

1. QEMU sends virtio IRQ to the VM
2. Xen handles the IRQ and injects it into DomU
3. DomU tries to handle it and accesses a virtio mmio register
4. This produces a memory fault that leads to switch back to KVM (and
then to QEMU of course) so QEMU can handle MMIO access
5. When QEMU continues vCPU thread, it immediately gets switched back to
vEL2 (probably due to timer IRQ, but this is my speculation)
6. the vCPU is spinning in the aforementioned loop

Looks like this happens because of empty LRs, but we still didn't
confirmed this because the issue is not 100% reproducible. I'll be glad
to hear any suggestions.

This is a part of the KVM trace, where you can see that vCPU in question
tries to perform ERET to Linux in DomU but is being brought back to
vEL2. In this particular case this is vCPU1 / vvCPU0. I filtered out
other vCPUs to reduce clutter.

 qemu-system-aar-41290   [000] d.... 12023.695620: kvm_entry: PC: 0x00000a0=
000267c80
 qemu-system-aar-41290   [000] d.... 12023.695620: vgic_update_irq_pending:=
 VCPU: 1, IRQ 25, level: 0
 qemu-system-aar-41290   [000] d.... 12023.695621: kvm_get_timer_map: VCPU:=
 1, dv: 2, dp: 3, ev: 1, ep: 0
 qemu-system-aar-41290   [000] d.... 12023.695621: kvm_timer_emulate: arch_=
timer_ctx_index: 1 (should_fire: 1)
 qemu-system-aar-41290   [000] d.... 12023.695621: kvm_timer_emulate: arch_=
timer_ctx_index: 0 (should_fire: 0)
 qemu-system-aar-41290   [000] ..... 12023.695621: kvm_exit: TRAP: HSR_EC: =
0x001a (ERET), PC: 0x00000a00002674e0
 qemu-system-aar-41290   [000] ..... 12023.695621: kvm_get_timer_map: VCPU:=
 1, dv: 2, dp: 3, ev: 1, ep: 0
 qemu-system-aar-41290   [000] d.... 12023.695622: kvm_timer_save_state:   =
 CTL: 0x000000 CVAL:              0x0 arch_timer_ctx_index: 2
 qemu-system-aar-41290   [000] d.... 12023.695622: kvm_timer_save_state:   =
 CTL: 0x000005 CVAL:   0x426f7d24736c arch_timer_ctx_index: 3
 qemu-system-aar-41290   [000] ..... 12023.695622: kvm_nested_eret: elr_el2=
: 0xffffffc0010ac5a4 spsr_el2: 0x024000c5 (M: EL1h) hcr_el2: 807c663f
 qemu-system-aar-41290   [000] ..... 12023.695622: kvm_get_timer_map: VCPU:=
 1, dv: 1, dp: 0, ev: 2, ep: 3
 qemu-system-aar-41290   [000] ..... 12023.695622: kvm_timer_update_irq: VC=
PU: 1, IRQ 27, level 1
 qemu-system-aar-41290   [000] ..... 12023.695623: vgic_update_irq_pending:=
 VCPU: 1, IRQ 27, level: 1
 qemu-system-aar-41290   [000] ..... 12023.695623: kvm_timer_update_irq: VC=
PU: 1, IRQ 30, level 0
 qemu-system-aar-41290   [000] ..... 12023.695623: vgic_update_irq_pending:=
 VCPU: 1, IRQ 30, level: 0
 qemu-system-aar-41290   [000] d.... 12023.695623: kvm_timer_restore_state:=
 CTL: 0x000005 CVAL:      0x48aac64bd arch_timer_ctx_index: 1
 qemu-system-aar-41290   [000] d.... 12023.695624: kvm_timer_restore_state:=
 CTL: 0x000000 CVAL:              0x0 arch_timer_ctx_index: 0
 qemu-system-aar-41290   [000] ..... 12023.695624: kvm_timer_emulate: arch_=
timer_ctx_index: 2 (should_fire: 0)
 qemu-system-aar-41290   [000] ..... 12023.695624: kvm_timer_emulate: arch_=
timer_ctx_index: 3 (should_fire: 1)
 qemu-system-aar-41290   [000] ..... 12023.695626: kvm_get_timer_map: VCPU:=
 1, dv: 1, dp: 0, ev: 2, ep: 3
 qemu-system-aar-41290   [000] d.... 12023.695626: kvm_timer_save_state:   =
 CTL: 0x000005 CVAL:      0x48aac64bd arch_timer_ctx_index: 1
 qemu-system-aar-41290   [000] d.... 12023.695627: kvm_timer_save_state:   =
 CTL: 0x000000 CVAL:              0x0 arch_timer_ctx_index: 0
 qemu-system-aar-41290   [000] ..... 12023.695627: kvm_inject_nested_except=
ion: IRQ: esr_el2 0x0 elr_el2: 0xffffffc0010ac5a4 spsr_el2: 0x024000c5 (M: =
EL1h) hcr_el2: 807c663f
 qemu-system-aar-41290   [000] ..... 12023.695627: kvm_get_timer_map: VCPU:=
 1, dv: 2, dp: 3, ev: 1, ep: 0
 qemu-system-aar-41290   [000] ..... 12023.695627: kvm_timer_update_irq: VC=
PU: 1, IRQ 28, level 0
 qemu-system-aar-41290   [000] ..... 12023.695627: vgic_update_irq_pending:=
 VCPU: 1, IRQ 28, level: 0
 qemu-system-aar-41290   [000] ..... 12023.695628: kvm_timer_update_irq: VC=
PU: 1, IRQ 26, level 1
 qemu-system-aar-41290   [000] ..... 12023.695628: vgic_update_irq_pending:=
 VCPU: 1, IRQ 26, level: 1
 qemu-system-aar-41290   [000] d.... 12023.695628: kvm_timer_restore_state:=
 CTL: 0x000000 CVAL:              0x0 arch_timer_ctx_index: 2
 qemu-system-aar-41290   [000] d.... 12023.695628: kvm_timer_restore_state:=
 CTL: 0x000005 CVAL:   0x426f7d24736c arch_timer_ctx_index: 3
 qemu-system-aar-41290   [000] ..... 12023.695629: kvm_timer_emulate: arch_=
timer_ctx_index: 1 (should_fire: 1)
 qemu-system-aar-41290   [000] ..... 12023.695629: kvm_timer_emulate: arch_=
timer_ctx_index: 0 (should_fire: 0)
 qemu-system-aar-41290   [000] d.... 12023.695632: vgic_update_irq_pending:=
 VCPU: 1, IRQ 25, level: 0
 qemu-system-aar-41290   [000] d.... 12023.695632: vgic_update_irq_pending:=
 VCPU: 1, IRQ 25, level: 0
 qemu-system-aar-41290   [000] d.... 12023.695633: vgic_update_irq_pending:=
 VCPU: 1, IRQ 25, level: 0
 qemu-system-aar-41290   [000] d.... 12023.695633: kvm_entry: PC: 0x00000a0=
000267c80
 qemu-system-aar-41290   [000] d.... 12023.695634: vgic_update_irq_pending:=
 VCPU: 1, IRQ 25, level: 0
 qemu-system-aar-41290   [000] d.... 12023.695634: kvm_get_timer_map: VCPU:=
 1, dv: 2, dp: 3, ev: 1, ep: 0
 qemu-system-aar-41290   [000] d.... 12023.695634: kvm_timer_emulate: arch_=
timer_ctx_index: 1 (should_fire: 1)
 qemu-system-aar-41290   [000] d.... 12023.695635: kvm_timer_emulate: arch_=
timer_ctx_index: 0 (should_fire: 0)
 qemu-system-aar-41290   [000] ..... 12023.695635: kvm_exit: TRAP: HSR_EC: =
0x001a (ERET), PC: 0x00000a00002674e0
 qemu-system-aar-41290   [000] ..... 12023.695635: kvm_get_timer_map: VCPU:=
 1, dv: 2, dp: 3, ev: 1, ep: 0
 qemu-system-aar-41290   [000] d.... 12023.695635: kvm_timer_save_state:   =
 CTL: 0x000000 CVAL:              0x0 arch_timer_ctx_index: 2
 qemu-system-aar-41290   [000] d.... 12023.695635: kvm_timer_save_state:   =
 CTL: 0x000005 CVAL:   0x426f7d24736c arch_timer_ctx_index: 3
 qemu-system-aar-41290   [000] ..... 12023.695636: kvm_nested_eret: elr_el2=
: 0xffffffc0010ac5a4 spsr_el2: 0x024000c5 (M: EL1h) hcr_el2: 807c663f
 qemu-system-aar-41290   [000] ..... 12023.695636: kvm_get_timer_map: VCPU:=
 1, dv: 1, dp: 0, ev: 2, ep: 3
 qemu-system-aar-41290   [000] ..... 12023.695636: kvm_timer_update_irq: VC=
PU: 1, IRQ 27, level 1
 qemu-system-aar-41290   [000] ..... 12023.695636: vgic_update_irq_pending:=
 VCPU: 1, IRQ 27, level: 1
 qemu-system-aar-41290   [000] ..... 12023.695636: kvm_timer_update_irq: VC=
PU: 1, IRQ 30, level 0
 qemu-system-aar-41290   [000] ..... 12023.695637: vgic_update_irq_pending:=
 VCPU: 1, IRQ 30, level: 0
 qemu-system-aar-41290   [000] d.... 12023.695637: kvm_timer_restore_state:=
 CTL: 0x000005 CVAL:      0x48aac64bd arch_timer_ctx_index: 1
 qemu-system-aar-41290   [000] d.... 12023.695637: kvm_timer_restore_state:=
 CTL: 0x000000 CVAL:              0x0 arch_timer_ctx_index: 0
 qemu-system-aar-41290   [000] ..... 12023.695637: kvm_timer_emulate: arch_=
timer_ctx_index: 2 (should_fire: 0)
 qemu-system-aar-41290   [000] ..... 12023.695637: kvm_timer_emulate: arch_=
timer_ctx_index: 3 (should_fire: 1)
 qemu-system-aar-41290   [000] ..... 12023.695640: kvm_get_timer_map: VCPU:=
 1, dv: 1, dp: 0, ev: 2, ep: 3
 qemu-system-aar-41290   [000] d.... 12023.695640: kvm_timer_save_state:   =
 CTL: 0x000005 CVAL:      0x48aac64bd arch_timer_ctx_index: 1
 qemu-system-aar-41290   [000] d.... 12023.695640: kvm_timer_save_state:   =
 CTL: 0x000000 CVAL:              0x0 arch_timer_ctx_index: 0
 qemu-system-aar-41290   [000] ..... 12023.695640: kvm_inject_nested_except=
ion: IRQ: esr_el2 0x0 elr_el2: 0xffffffc0010ac5a4 spsr_el2: 0x024000c5 (M: =
EL1h) hcr_el2: 807c663f
 qemu-system-aar-41290   [000] ..... 12023.695641: kvm_get_timer_map: VCPU:=
 1, dv: 2, dp: 3, ev: 1, ep: 0
 qemu-system-aar-41290   [000] ..... 12023.695641: kvm_timer_update_irq: VC=
PU: 1, IRQ 28, level 0
 qemu-system-aar-41290   [000] ..... 12023.695641: vgic_update_irq_pending:=
 VCPU: 1, IRQ 28, level: 0
 qemu-system-aar-41290   [000] ..... 12023.695641: kvm_timer_update_irq: VC=
PU: 1, IRQ 26, level 1
 qemu-system-aar-41290   [000] ..... 12023.695641: vgic_update_irq_pending:=
 VCPU: 1, IRQ 26, level: 1
 qemu-system-aar-41290   [000] d.... 12023.695642: kvm_timer_restore_state:=
 CTL: 0x000000 CVAL:              0x0 arch_timer_ctx_index: 2
 qemu-system-aar-41290   [000] d.... 12023.695642: kvm_timer_restore_state:=
 CTL: 0x000005 CVAL:   0x426f7d24736c arch_timer_ctx_index: 3
 qemu-system-aar-41290   [000] ..... 12023.695642: kvm_timer_emulate: arch_=
timer_ctx_index: 1 (should_fire: 1)
 qemu-system-aar-41290   [000] ..... 12023.695642: kvm_timer_emulate: arch_=
timer_ctx_index: 0 (should_fire: 0)
 qemu-system-aar-41290   [000] d.... 12023.695644: vgic_update_irq_pending:=
 VCPU: 1, IRQ 25, level: 0
 qemu-system-aar-41290   [000] d.... 12023.695645: vgic_update_irq_pending:=
 VCPU: 1, IRQ 25, level: 0
 qemu-system-aar-41290   [000] d.... 12023.695645: vgic_update_irq_pending:=
 VCPU: 1, IRQ 25, level: 0
 qemu-system-aar-41290   [000] d.... 12023.695646: kvm_entry: PC: 0x00000a0=
000267c80
 qemu-system-aar-41290   [000] d.... 12023.695647: vgic_update_irq_pending:=
 VCPU: 1, IRQ 25, level: 0
 qemu-system-aar-41290   [000] d.... 12023.695647: kvm_get_timer_map: VCPU:=
 1, dv: 2, dp: 3, ev: 1, ep: 0
 qemu-system-aar-41290   [000] d.... 12023.695647: kvm_timer_emulate: arch_=
timer_ctx_index: 1 (should_fire: 1)
 qemu-system-aar-41290   [000] d.... 12023.695647: kvm_timer_emulate: arch_=
timer_ctx_index: 0 (should_fire: 0)
 qemu-system-aar-41290   [000] ..... 12023.695647: kvm_exit: TRAP: HSR_EC: =
0x001a (ERET), PC: 0x00000a00002674e0
 qemu-system-aar-41290   [000] ..... 12023.695648: kvm_get_timer_map: VCPU:=
 1, dv: 2, dp: 3, ev: 1, ep: 0
 qemu-system-aar-41290   [000] d.... 12023.695648: kvm_timer_save_state:   =
 CTL: 0x000000 CVAL:              0x0 arch_timer_ctx_index: 2
 qemu-system-aar-41290   [000] d.... 12023.695648: kvm_timer_save_state:   =
 CTL: 0x000005 CVAL:   0x426f7d24736c arch_timer_ctx_index: 3
 qemu-system-aar-41290   [000] ..... 12023.695648: kvm_nested_eret: elr_el2=
: 0xffffffc0010ac5a4 spsr_el2: 0x024000c5 (M: EL1h) hcr_el2: 807c663f


--=20
WBR, Volodymyr=

