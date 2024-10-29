Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C11D3A67C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gU+A3vZeuAqIH7gthqJEyKYJuMsoDymMbrRMU4WfFVQ=; b=sWVPkI7cXY4/sEP9l3Oq3LQMJL
	te4+18GqD6eQ64AcZZ0mPGvV7aXm9NsLvTKKJy5n7Uajwtr6CqbxAa0BM2sVSmlEa59d/jO9OJgjV
	pVdZfGIpelC8aZ8jNpvzD2Y0W1ccqhIhAWuR01KcMdouiUm8Sd5QsUS1evASynJO8GVHK0Pf9e43z
	YWqcuW5tOpxZmDigSofqijnyQFDDMZ/GR4H4wyt+nWnGbX/F6cR8luQUd4bzfVIWvCnCb/YVW6xGY
	Z0lbgvD0EeMXoqxJaI4FwSgr1epTUkHIwERY2iNOx6KyM9AP7L6tR8lBkMIXf2eesYfEXAOiq2Ymx
	pHWh/V9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rFa-0000000FYLG-3hUV;
	Tue, 29 Oct 2024 18:47:30 +0000
Received: from mail-am0eur02on2060f.outbound.protection.outlook.com ([2a01:111:f403:2606::60f] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5pJi-0000000F9r9-0HOo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:43:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOxzMl+kxnh0NcFlrSRewKZmHH7YgEAUNEplN8y889cdpKwdRPapaQbRzx+8YelMYkFCYSBYAYxSneSO3/VdIiKcPQ7xmqnt190DcUqYaW36bYqK3vTH5PWVUt6jjjL0tzlxDN9m/1VVxMeCax/hFUCEY+ripBDOTcnlbyqycGakIDaT4TMqG29PzE+0kUBCxIza8sH8zMwVb6za5DjYSdolCi2eh6DYRKzhZJipM4qYbM3KRe9kQb1icw1nIRFlPxvp8pZNvvGd6B0OXLjNuki9JRr/Y9dTgZlFkzUwf9+2f/4//o0YW/AOBwJ8r6sekR8Ij8scNMhNN3TD+/2JmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gU+A3vZeuAqIH7gthqJEyKYJuMsoDymMbrRMU4WfFVQ=;
 b=BTlJfaeycnPkFYiunDix6IVx3ziCu/nbWXn5hefvasvEek4lOFU336lt0Xm/dphKbGMddDLSHDcnNm5eODbQNNXwQvJdfj7qPdYTG4RjpO/5ZGHxGRYE+yquMsu6KSjSOsV6SCIW72EjaxXEDHEg9+KeK62FZz6hOZ/K8FK8HQFs9nC85Q7l/D4D7OoJk6rU9/m6pnH5V1cevBo1hAXQFLJuTJ3qTb4BpC2gl8f4dKh2xQThzFkvtW4k1qkYuwsuxe0utueOfZnkPFt3DyfQIeTqloaIrpYslNy8eUf5yrk65i8kAZJp6fY4NhlcBShzcMXB2IwH4tFIZuTE35h4CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gU+A3vZeuAqIH7gthqJEyKYJuMsoDymMbrRMU4WfFVQ=;
 b=bElhZhDPwTctpc9OmUxi+0SK/hq9JEgVy80qi1hJl6Nn6GcxKY/or6Mxs3A8F+QRmlkNVeKJRU70qIZlojCvOw19HPjjVg7fi39AbNNVTm/krF+oxQECHVkQIal4FribvLY/Qk2rpB7/RfnYXNsdWEynEdkE1og4qC3xNVUGb/n+z2IGCeLQQUth81WzOuGrLpiWzUqSuwFAam5SbyLZsNMiKsMFO4/oliG1a0RqVSi5EnZPbqcz3CNIFds/3A18cRUN/aEHVXPBtsEvTepdf34khFSZoR0bVhhJmT9n2EwiY7cO6xnPwasjQG29gUOVxvMZjC679JiySI0rK2tc9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 16:43:31 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 16:43:31 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Radu Bulie <radu-andrei.bulie@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 2/3] net: dpaa_eth: add assertions about SGT entry offsets in sg_fd_to_skb()
Date: Tue, 29 Oct 2024 18:43:16 +0200
Message-Id: <20241029164317.50182-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029164317.50182-1-vladimir.oltean@nxp.com>
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: 62df47c5-94fd-40cc-e72f-08dcf838d27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RpCZhjFdga1MOQ4ByjJhqawS1l0Urj2Y9Q94/u40nyWqK7H3zuX7trofIXL2?=
 =?us-ascii?Q?XGMExGfA9Yqmva/xAdMrjADhzTS498cgP/ujvx3cIrF8oqNCMsFdWiLbHrC/?=
 =?us-ascii?Q?F8zU6H0tF6WD0eTqGbZniIz6kTgUy1twOLyNPfphAJnsMPfCBoujTfGFCLm9?=
 =?us-ascii?Q?9yzH/G0hWUQ1rqGO6K7XkughiwBNvr7cf292Jh4IzkLuv/HJVM9k7/9BzJSw?=
 =?us-ascii?Q?0TP45IiNI/9BcDWnf75B9Up6DW5esK+ZC/ptK6Yf9EgjV3V6yTR/W+rWljtJ?=
 =?us-ascii?Q?QI2v8tkHCrxVKtLaEe+28u/l+fRejBoqb6yaEeUC/xVnyCbY76REmKT+l656?=
 =?us-ascii?Q?qNkVlV5gCI2Fg90OMuT93dAIGXWfR8+O6TNP3DvnjsNUKT4ptzZ7bfz3cfl+?=
 =?us-ascii?Q?iceGwVJA+9TKuHj4qh4m891fxrxSFdn+TC3QzvS3LYqXC1Au7UgZLFwT/NQb?=
 =?us-ascii?Q?8CsV3+wfSfi8rv2NVgfVFvhO/Z5hpBcrYrH0cQGG1JMmTt70qf6ZdUVM2BIm?=
 =?us-ascii?Q?FAD2s/CJxZ1vJ8bgn6x6ivy9VZ4LePb477CoOfj9BYAv39yKYxVAnSYbAa7T?=
 =?us-ascii?Q?PxG6gIL7l8E4tYbBIIfRbkriHoYIrsrK2sHTQhMRTgBnpfQxQKeCI9P/tD8f?=
 =?us-ascii?Q?99hvROHVVNcwoaMUdd3nGknQA2jEvrFh5p1l5PG/IKpdHAqz2bq/NoSXV/up?=
 =?us-ascii?Q?S2fFzYzpoTlpxYJ4yg9SmOQdFM8lh2Dk//Ojg6lSIYWmxiSr4UOUXDgcVx15?=
 =?us-ascii?Q?GVSoPBKEvsCkvBes7OV5uZ6O1nXexXTF4xNV+JesroiPJSUWZuLqGBSeBlg4?=
 =?us-ascii?Q?wP3nAGogH0jV0q9oQDmLAZH9j1gaAsRZNfBnTtHTxfwnYaCHydnIsxKjiB0l?=
 =?us-ascii?Q?6LJjXPTExR96NTLZE041F1z5TzTNfP0EQLziFD3e84uxzrNzlaht6pxLNr9e?=
 =?us-ascii?Q?38GTKHfunux8nlAcsieuGGWXCxvrbmNI6mxfdB5lIKiL+/bGL4x/zNp1kLq1?=
 =?us-ascii?Q?0sXL/Gon3agxKXGlazVzcJduRki0E9fvXFMimLSp8MydCBS7119YTey96Pkt?=
 =?us-ascii?Q?l39QDizXj8vAV8vpPgXjtiDd4VDiHsLWeay0HuOndYQ5C9l2YzxLdVXQgGMk?=
 =?us-ascii?Q?+WuxEM03yUmMUEVZHLxK0/P9DQqIWevQN+4iexlAy2i68AO+PsqMOlZ4EHP8?=
 =?us-ascii?Q?8/LoZbnpA4e1Sbp4pyIHuTW0cV2+DA1aqVLFF2sdjuzZMqre1V28UIoiu1cE?=
 =?us-ascii?Q?wlgdPoy834GG1ZPoofLiqz3r2xxThPGsEbn7UjL/3il2DMX1fAuySV6EaKBy?=
 =?us-ascii?Q?gHnFZecoejJDGGENCSmDJU3C1yGbZlXsDX3gs5V7gbiN6tZ/yaYO8JOTTCcW?=
 =?us-ascii?Q?FzVJjB0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z1+pMNd573o8DyGqsjYHzuAnIwoBFnA4Sb0rACkaAIVaJY3XomlvsBexjDdD?=
 =?us-ascii?Q?C9m17zdwG77sg9WvDF9s0KrZXv+AYBj+svRP+z2T4PDR33wTuzIJsC7APOtV?=
 =?us-ascii?Q?fAXZxncZ2I0rrheuKKXKSddtesN/FK305DBAT1slTvc3ht+oLxIDiSz0lnfA?=
 =?us-ascii?Q?gSfxWJyLvSCM6GCQAmO8FZIu93Oe9+dj26n+XBbOJXjzRlKfHHS14wCZKfds?=
 =?us-ascii?Q?J/9Dmvb6qNXXWj6QNSODmpLRm97AxAYStQisnefdMNfYzi605fWWMVJteGkH?=
 =?us-ascii?Q?K0YjGdhDvTC0jv554NJzCyvuXzCyctL77Jr6s2CLame184zWn2uldtUG15Ih?=
 =?us-ascii?Q?qUUYx6NP28mmiraLzj/K0L4L/dtXF6O8hYpeXFCS5C/0nKCbFr9dCa7qlYBY?=
 =?us-ascii?Q?AYVdP6sbMrTNizUM/HKmbTc1qpjVn0fsv1SwGyOZBNdwe4ngmPNZW+2f1wSD?=
 =?us-ascii?Q?2CxOw1cY1UAs/BtQNCAqupwULn7MLnjHYauU5B0H0kXCzv17Ip9kT3GUaoRI?=
 =?us-ascii?Q?B0yI0Ax2FqO4mFNUjNRj9+eJ00SxT+mYIMiMUkbNx4yLhdSgjEqlJTrhbv7/?=
 =?us-ascii?Q?iaGP5XHE0CWNzi3f/J5/BjbV6sNWlST2VCk7K7K3hW9SzqAJsRFYTYHwPiyB?=
 =?us-ascii?Q?bu5YB3sg50dh5pLDvORsqrVS6Tbri/eE6QdvdNnn2qxMPvCWjQTjoUSoGh68?=
 =?us-ascii?Q?QqHmUnBEtrhJhCEZDCYBLZFMUz2AIIKDJRBkoM+Ydxl6ZJtbnHnbLS1azPrL?=
 =?us-ascii?Q?dNqwt1aBungbYRvheXEyPVWqk3kWwE5G/jjJpWFmdh0jUDvq9WPcSBQXHGKk?=
 =?us-ascii?Q?j9Hq08DMnOK2h/tSi712RCtl0kGBwJ/WVuRBTKcrkniJT/oeUmVEO5oGrVSF?=
 =?us-ascii?Q?Dkdybd+onooXUOvzgqx40o+zSxWNeF5t8Qsv7Wgfxd/fZSyznmFJ9p1K4rm9?=
 =?us-ascii?Q?Pxy+NZgV/Aq+RKKKsI7N08ecZ1Fu435N00NTSJe+9Y9+Te0QLYE5Hjc1J2lG?=
 =?us-ascii?Q?tU9kA83NjgpwBKKWVGCSfBVHCLTyXGTEJFU7aoD95f4Q8/dfkeOLOXQQkTTd?=
 =?us-ascii?Q?lsMkM1UTcoKaWL+QnLhrqreg/2ReUw8kFpZ0PAvPwFuLGv0L5BbFkZ7RIHmg?=
 =?us-ascii?Q?77N/FiCPWm9qzcBrlstqG3QYcfE9qfwNLiRNycv1WH78U2yN5DnJn1IufNX1?=
 =?us-ascii?Q?6ZqZ50jLDQ74Ql3N8RuUKlEs5pJA3OolKhv61+DousKjOCvy+aQU4YLWenqb?=
 =?us-ascii?Q?iF8D5TnYEpM/ewu1nvKsGlqE/uLo5Td8WwzwUwYNsWFdiaZkueyd1e7jE9iO?=
 =?us-ascii?Q?/rebFbXgUDIz+wwRj2dd+qMc6BlfpcR6qB7JdVYjiZciN2okE5fZQchCwY7w?=
 =?us-ascii?Q?pfATTJzh7gdXHt2vQtF5sWahKdy2XFg0A/nfXkHRDdURcpZwrTjbKpU6BXkD?=
 =?us-ascii?Q?UBWf8ACSlQt40CNXVnaW8ZPE4eScL2yYiJlAysPhaXjftn2ZnRpRWmpESvIl?=
 =?us-ascii?Q?KWcI7NaD1Xws7QGZHiiWfwiIkUHGoWtxtGcxwlQvBSmradOQQ+7uOGFa5pxO?=
 =?us-ascii?Q?bkSqfG434XlbrlWHUn8GzuHCnueoN2mLpeusO1ZGGTOKbPE0TicEi/XlNBF4?=
 =?us-ascii?Q?Yw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62df47c5-94fd-40cc-e72f-08dcf838d27b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:43:31.6016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xminaAuOe/XnaYsUGatFEUHloyICglhK2NbfzZO7THzhc0IUJjKm039HxmILIAtkRE4ZKc+ci9bIYLZjhqVfcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_094338_262295_A2C7D7CE 
X-CRM114-Status: GOOD (  24.25  )
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

Multi-buffer frame descriptors (FDs) point to a buffer holding a
scatter/gather table (SGT), which is a finite array of fixed-size
entries, the last of which has qm_sg_entry_is_final(&sgt[i]) == true.

Each SGT entry points to a buffer holding pieces of the frame.
DPAARM.pdf explains in the figure called "Internal and External Margins,
Scatter/Gather Frame Format" that the SGT table is located within its
buffer at the same offset as the frame data start is located within the
first packet buffer.

                                 +------------------------+
    Scatter/Gather Buffer        |        First Buffer    |   Last Buffer
      ^ +------------+ ^       +-|---->^ +------------+   +->+------------+
      | |            | | ICEOF | |     | |            |      |////////////|
      | +------------+ v       | |     | |            |      |////////////|
 BSM  | |/ part of //|         | |BSM  | |            |      |////////////|
      | |/ Internal /|         | |     | |            |      |////////////|
      | |/ Context //|         | |     | |            |      |// Frame ///|
      | +------------+         | |     | |            | ...  |/ content //|
      | |            |         | |     | |            |      |////////////|
      | |            |         | |     | |            |      |////////////|
      v +------------+         | |     v +------------+      |////////////|
        | Scatter/ //| sgt[0]--+ |       |// Frame ///|      |////////////|
        | Gather List| ...       |       |/ content //|      +------------+ ^
        |////////////| sgt[N]----+       |////////////|      |            | | BEM
        |////////////|                   |////////////|      |            | |
        +------------+                   +------------+      +------------+ v

BSM = Buffer Start Margin, BEM = Buffer End Margin, both are configured
by dpaa_eth_init_rx_port() for the RX FMan port relevant here.

sg_fd_to_skb() runs in the calling context of rx_default_dqrr() -
the NAPI receive callback - which only expects to receive contiguous
(qm_fd_contig) or scatter/gather (qm_fd_sg) frame descriptors.
Everything else is irrelevant codewise.

The processing done by sg_fd_to_skb() is weird because it does not
conform to the expectations laid out by the aforementioned figure.
Namely, it parses the OFFSET field only for SGT entries with i != 0
(codewise, skb != NULL). In those cases, OFFSET should always be 0.
Also, it does not parse the OFFSET field for the sgt[0] case, the only
case where the buffer offset is meaningful in this context. There, it
uses the fd_off, aka the offset to the Scatter/Gather List in the
Scatter/Gather Buffer from the figure. By equivalence, they should both
be equal to the BSM (in turn, equal to priv->rx_headroom).

This can actually be explained due to the bug which we had in
qm_sg_entry_get_off() until the previous change:

- qm_sg_entry_get_off() did not actually _work_ for sgt[0]. It returned
  zero even with a non-zero offset, so fd_off had to be used as a fill-in.

- qm_sg_entry_get_off() always returned zero for sgt[i>0], and that
  resulted in no user-visible bug, because the buffer offset _was
  supposed_ to be zero for those buffers. So remove it from calculations.

Add assertions about the OFFSET field in both cases (first or subsequent
SGT entries) to make it absolutely obvious when something is not well
handled.

Similar logic can be seen in the driver for the architecturally similar
DPAA2, where dpaa2_eth_build_frag_skb() calls dpaa2_sg_get_offset() only
for i == 0. For the rest, there is even a comment stating the same thing:

	 * Data in subsequent SG entries is stored from the
	 * beginning of the buffer, so we don't need to add the
	 * sg_offset.

Tested on LS1046A.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index ac06b01fe934..e280013afa63 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -1820,7 +1820,6 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
 	struct page *page, *head_page;
 	struct dpaa_bp *dpaa_bp;
 	void *vaddr, *sg_vaddr;
-	int frag_off, frag_len;
 	struct sk_buff *skb;
 	dma_addr_t sg_addr;
 	int page_offset;
@@ -1863,6 +1862,11 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
 			 * on Tx, if extra headers are added.
 			 */
 			WARN_ON(fd_off != priv->rx_headroom);
+			/* The offset to data start within the buffer holding
+			 * the SGT should always be equal to the offset to data
+			 * start within the first buffer holding the frame.
+			 */
+			WARN_ON_ONCE(fd_off != qm_sg_entry_get_off(&sgt[i]));
 			skb_reserve(skb, fd_off);
 			skb_put(skb, qm_sg_entry_get_len(&sgt[i]));
 		} else {
@@ -1876,21 +1880,23 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
 			page = virt_to_page(sg_vaddr);
 			head_page = virt_to_head_page(sg_vaddr);
 
-			/* Compute offset in (possibly tail) page */
+			/* Compute offset of sg_vaddr in (possibly tail) page */
 			page_offset = ((unsigned long)sg_vaddr &
 					(PAGE_SIZE - 1)) +
 				(page_address(page) - page_address(head_page));
-			/* page_offset only refers to the beginning of sgt[i];
-			 * but the buffer itself may have an internal offset.
+
+			/* Non-initial SGT entries should not have a buffer
+			 * offset.
 			 */
-			frag_off = qm_sg_entry_get_off(&sgt[i]) + page_offset;
-			frag_len = qm_sg_entry_get_len(&sgt[i]);
+			WARN_ON_ONCE(qm_sg_entry_get_off(&sgt[i]));
+
 			/* skb_add_rx_frag() does no checking on the page; if
 			 * we pass it a tail page, we'll end up with
-			 * bad page accounting and eventually with segafults.
+			 * bad page accounting and eventually with segfaults.
 			 */
-			skb_add_rx_frag(skb, i - 1, head_page, frag_off,
-					frag_len, dpaa_bp->size);
+			skb_add_rx_frag(skb, i - 1, head_page, page_offset,
+					qm_sg_entry_get_len(&sgt[i]),
+					dpaa_bp->size);
 		}
 
 		/* Update the pool count for the current {cpu x bpool} */
-- 
2.34.1


