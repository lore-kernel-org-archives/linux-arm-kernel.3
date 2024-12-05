Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDFFE77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 06:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lXCCPJHG86vjR6hfcJBzMhMUp96f9kLd1pWOlvYc4VY=; b=CoQjiJ1mrYB19rs3CjleypG3hM
	eihNIzzBH5H1mplIanIi+LqDOB7KK/3RGZFcZ/QQrdCnH0PC2vzxMkO6ZohnMtCvgvTqYWvTVt00f
	TigQ5QEG1eK56Elzs8lyy0H9KNF3lJyro80/+8lWFy/CfWbLYVi01anVrMo8iq8KlPprhE/4Zz9NF
	77y/a4L9P03fziA0cOrJyU0jTFqKwBYdDmCw2mZjzoJ5eyP2y2nJfpJlNFGlv44tJnPGpdOD/odrv
	UmKge8bs2bgGnkTVafGZLY3TZVpW7t0ZIKPQLYFsCT4j1+SqmQpvBiBk4UOZI63Qf0qVoOCG4GCGm
	vFmsNqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ5Ch-0000000Esdy-2D6a;
	Thu, 05 Dec 2024 06:19:11 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ5Bg-0000000EsQj-3EZk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 06:18:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCfRz6ad24YiieAwO+gnsLdimNaXE99e66/lgJE5R99IpHUarjEo60fhItBkMhU8uk7PiHZTV4Z3b6lcrtxmCNUU/mg8E9MOr+UGjLM5oMrPLj4hO0gkAjlnSxRY/mVhGN8oIJnfVEYOKKPbQp1q64Re8p/2/sVRKHZvtrak9GUJmhv8GKVam0s2jnv+ZRp/0OfKlFzSRIgWU11Zt2zV7Jvlkss0v3gENL0V/3AeYLJBB21skJl5BMHgo3E8Lsn7bPYKOmGxjOUT3WtNMo/Dw4EfdQqSc0IFbk2rc2ET6MxIiXBiRJV5i5UpO7wtb3y/92cXOECoSvINOSLT7f2CxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXCCPJHG86vjR6hfcJBzMhMUp96f9kLd1pWOlvYc4VY=;
 b=Hrtqud218yfZZu2r3Nv3W5tfmzquDjoAmC+zQYocu2LY/O+NklZgG4X45Y6W6YiDaKFe3RhbQOU+32pqct8ZrbhuWpelU0zI3fxWSNtpQlpFp8ytaqx/x22ABuzrlW3ka27mlFokelYzQ2jXAopSDQkKcNlAyWPSm4xwbLBvaJAeYwyybnfcYNwIkdXRSC+3wRh830+uD0/l2cPvstEINB2cXstPV9ibhjZvVgCs8GL8pu5/3CZkAP1YZRBlJu8VLKo7xMXqG0r9+4KnImfJjVKDoog+Ohuo8vjUG4i+tsPqeVYgjtOAviIFbQOY1hyiwr4b8vZ6heX1WQtJtlxhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXCCPJHG86vjR6hfcJBzMhMUp96f9kLd1pWOlvYc4VY=;
 b=lApVODr+SbhC4iKonNJMe9aLwHvE/2B0hxccx8Rr7kt/bmoHkKCC/eMnVm++wtdHxc0LKQlFmWG+lOMgDBhLNEaADlNIiErM0rjdekUIjK+WlszKOJwu2mJ3NasPv/FJQZ7pxw81ziYwBHTaoC8E9G9unSTFiZWbQheoauPuCuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SJ0PR01MB7394.prod.exchangelabs.com (2603:10b6:a03:3f2::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.10; Thu, 5 Dec 2024 06:18:03 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%3]) with mapi id 15.20.8230.008; Thu, 5 Dec 2024
 06:18:03 +0000
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] perf/dwc_pcie: Fix the swapped event numbers as well as the documentation
Date: Thu,  5 Dec 2024 06:19:12 +0000
Message-ID: <20241205061914.5568-1-ilkka@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::13) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SJ0PR01MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f8f6b0-1324-4098-c6f6-08dd14f49383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g+GvCM8f/e4qfvh5mOgLmQrjBoAvf1EKJ7wSgRa9XEll9ComYswyvkqwafKq?=
 =?us-ascii?Q?avijX2mn9/jaD2Q9GtTbsjycpOsl2e7NCA2ayee0LBW3+JGt6BRK5f6FkAJl?=
 =?us-ascii?Q?bIGVq7Bd8WnBpHDZe/JOao/mpGPExYcdGeiQcv9W2MzM3sd0webGVjC2YfU3?=
 =?us-ascii?Q?MSdJ6hjeD1l8LhKfm8pVje5R9IgrlB8q9ctexUmMX/DLUvHuyl8uVSNCBxCv?=
 =?us-ascii?Q?eYiCQqArugUb4itBToJwpkeq4vwrWh36dTZs5nsIphgVf6H8hvwQBgaZte5I?=
 =?us-ascii?Q?4Z6h26O0Pt1QklJpUdkaseJFcjGfTGz8SFXy0zvbNpzAWPgZEyA6rUhWruVo?=
 =?us-ascii?Q?Gm00ELx9shVVGkP6ImwHTGBI5gWfjADA64QgFlObUl7q9ff19h8OtFj5+Oy7?=
 =?us-ascii?Q?DlwGhwHd2XOChUhjzcTweuKa0e9lhqmyB9YNJPqCkMdrdHhl/e7dm2HcNNAl?=
 =?us-ascii?Q?/woA96aUyy4QsBd/3Wo/T4BBW5qHjVNuPGiY/lHsN9mzmPPMyrf+lxXTOANo?=
 =?us-ascii?Q?w8ycenKKdQkpF2qLtAd4gbD0npicK6JSCYfY3yGFdpbx91WHI6SSrnB6A2p3?=
 =?us-ascii?Q?jugmo4saB0k/Al2J4WWNrdEPIeQHzgP9msMkAeL3KdUPR1+wYqLYDyhOs0ip?=
 =?us-ascii?Q?b1Bowv7aAKAZQte4My9ak/S94JWL8M04u/HUPgBB2W6usEfGClZpXbhy+Da8?=
 =?us-ascii?Q?tHhnp6P0Cl9pH+NV1HOxbTHtw8ala+RqX44wX39Rer+Xw3cesLBuks3IIWxs?=
 =?us-ascii?Q?ukAvUPfviBbC7izX0TzBGqNVbfYuyKv6o2K2yMg0bewErFalv0y1T9knjs37?=
 =?us-ascii?Q?3aoaMMZcJGd3jPK9dM9sSZQ2+zXS7gvqWQoz+g2gTnKUviqCfHriWZtfpyiu?=
 =?us-ascii?Q?Auf8H8//dy/o89EpUiXwP+PJHuciUmc2i9+EZd/GngU992u8xseT3ZQliaCv?=
 =?us-ascii?Q?s0XeCV/mpBg7HDHw3ogxPGY4MrmXh1X4NAptEpJOG9lzvmjJRPUTGoSj7sE2?=
 =?us-ascii?Q?Ytm+Vb2oe+F6B9OloB4YJI0d8ilZbgMt3CAveF9sC12MRRNhP3TI4tdzEMWb?=
 =?us-ascii?Q?a3Pk5Ha3Jl4VhjKBB98MnEt/ohtcdZQ8gYt8kvZ2zdr4Eb0ZfFoBjFSu7EFh?=
 =?us-ascii?Q?4H16BtOYjbkdiNr6JKNw3CtDvORJhoP8U91eAlEpCmde9N3Z8aT4ST1T0RZ3?=
 =?us-ascii?Q?QmQkPzAZJv/IbFtlNmqfffXi42yurpBx50PkHS7kcPehw4l/iqiGGrrV/ea3?=
 =?us-ascii?Q?9xwmGc0WcmWg2dinGxJhNbYjpyligoXteZ9/ed1Aq+20aKMsYRysatEKo+ag?=
 =?us-ascii?Q?IB5AnCf0SmcivHSDUoj4ikZe2Vb0GTjUTi7QFWB0jE+OzsC71ZIMTDykYI3i?=
 =?us-ascii?Q?ldNVmjauKaF2ewdg8bZzMp7DUl+52RL677/fu9w2MF35UPdbhw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kJ0YNROfxuuIhxH9gcnubpLcohTGRadKNJnUmN4d88iNIL9x1uXz8DsTaF0q?=
 =?us-ascii?Q?1qduprDcyXcG6e7dHqW+XpEmNC8ePt5bLMqbuw5OcY2Ar2xaxtLZrAmBhHB4?=
 =?us-ascii?Q?Ku/vyyJ/7HsqMqABZTXJn4NZ9Slvu/GjPDO8uaixgYnDFjPGYWnoc156R4Jz?=
 =?us-ascii?Q?NvWWPRiN4Jg8jT4Ly1FsfdN4E/unTqKYEgsmliaXlT19RDnoqm9o24vp+aRf?=
 =?us-ascii?Q?TXUj7Qe0bcJte1I2hsxQUZeZF9TVThDtkV4VQ14vbqy8iOSzNrYCvVPGsU0e?=
 =?us-ascii?Q?JheFSbhAw1ULAhL10jLhGg32xTOe528a2gV9yVtKPZ1zWdT4ITn0NPoJWQ2L?=
 =?us-ascii?Q?trbTP/7SZIuSmeCLefGInWefSpaDwT5xesJE1AowvwDJdoFiJhG1g+aBT3dy?=
 =?us-ascii?Q?CnmPVc2Bd3CIDdGpUjuM5vIJogqVfVZzSMY2d3J+KwhSAFuXekRIV1OiMalF?=
 =?us-ascii?Q?p7V+c5bVVgm6Hbjsa4IL5yt1XhjpVKJ1jZPGZ2Oueq2QtVKesva10LSVUT/Y?=
 =?us-ascii?Q?R0/9LYTw65s7V1sseVWD6W1rzvayYk3+x83yhju0+rFkL3KvH0OwBWYYYVUE?=
 =?us-ascii?Q?obvfkFGmgVfQpVls4N4yiBGgXfzcuTeqcEU0TmxxYQmqkDRia0fmh9Aq8Zv4?=
 =?us-ascii?Q?04dGTCjU7rPZR98RqyVRPC+4g2nhpP6c/4OEtBA3E7Dw8iasB4MqATPu/2Hw?=
 =?us-ascii?Q?72m/9alNQaCJzi1+arYYRcmVsoSPDy+Vngj1jz0Wh1lkDOmJxMNfG4XjAhe4?=
 =?us-ascii?Q?GncpsgAwtHk+9gRv9ezUjX/CTFhQzNfIC9i51TxeG86h6lo2EeV9o30MFRER?=
 =?us-ascii?Q?99ScJjFc9LtUhkETibWhSTgjdv2CQZlROFhA6aky7bt9j7AYXbDeC9FXThPn?=
 =?us-ascii?Q?xvlhVRQYgJtrFPns7lz7bo3OrZc5qhwyK145eeZmvK57K/+8RjYvqFfDT7Hb?=
 =?us-ascii?Q?AAQB61GXz/mhXRph+WM/9htua/+ry3KWLCuVmue0bTZEbVc1WJTXx7tsTzYM?=
 =?us-ascii?Q?GpJgUM9k5UGHqZIQwPN9eFRBIuKHYuh4+kaRBmBxdmWetWld1hjab27wClBk?=
 =?us-ascii?Q?p0bFKre7hSHG/H8CGTCZXNHp3enlFD0T/5r5l33WFDr6g2dKWu+z3Ev24c3p?=
 =?us-ascii?Q?Mrte6O1oXbKrff2AzhvqJYr9yqEx30128oBiOwvyzJfYw4Wjtn/1MZZbbxF4?=
 =?us-ascii?Q?358qSN3tRJyPOyUxPBj/1Pgx4rlgKBQx0zxKAPg8LCLsirqjCUu695yeim2l?=
 =?us-ascii?Q?h94SrLCN3j/krVmN/vTHO9NvjxBaeXcGZXq8woI+mqG2PS6UFs6rro2i9VE6?=
 =?us-ascii?Q?S1QF4LTkkQf+p1s9BbGg4HdmG2zAhVYvuk2W86Zt2NmGb5Api3tfHTDLZhK7?=
 =?us-ascii?Q?frhNV/uuKzsEPmu4D7AQ4PqJW0BBG8k9tAohufITnm1rmLKLAWv8Tzw9qo0x?=
 =?us-ascii?Q?57+hHfwQG2X75atLxrYX23qx4w6W5kaJSsgigISMKpsFKaa6YxiY+SiTwxiz?=
 =?us-ascii?Q?GXMCXwkCCTVO4U4WofLpI8IPEYaw99VVtWzcPa9UMxDAUXEvfsDK8Cewnxv6?=
 =?us-ascii?Q?JJAcip5f/oLmfuzUCdTbLaUwBIV7eWxxx0Ow/TqfdE2WEHTcOkv3SKSX73tD?=
 =?us-ascii?Q?PWsyRDHKN9SiZiXy1pYzPpc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f8f6b0-1324-4098-c6f6-08dd14f49383
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 06:18:03.7853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NycC4rszD5Y2PebpGlL7hONFDPu1XzPMMyFXxdcQq29gFP/Bely9YfOcrzN+vy1vbhVjwzYfZ1HzHwO1ojxVqLo/VijnY1k5/JdgeHt891XNsMlSsZGGKPvTIx5D8Y1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB7394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_221808_820504_EF8B4C8C 
X-CRM114-Status: UNSURE (   8.74  )
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

According to the versions of Designware Cores PCI Express Controller Databook
I found, the eventid for "L1 aux" is 0x08 and "TX L0s and RX L0S" is 0x09.

Shuai and Jing, could you verify that your document matches ours and the events
are indeed swapped in the driver at the moment?

Cheers, Ilkka



Ilkka Koskinen (2):
  perf/dwc_pcie: Fix the event numbers
  Documentation: dwc_pcie_pmu: Fix the mnemonics and eventid

 Documentation/admin-guide/perf/dwc_pcie_pmu.rst | 6 +++---
 drivers/perf/dwc_pcie_pmu.c                     | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.47.0


