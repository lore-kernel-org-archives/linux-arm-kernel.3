Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FDC109C059
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 19:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mX8itn9hZHsoDApBW80tjxpj7OCJtPoNrHD1ptQp5LA=; b=2fQt0Lr8HszBjWkY1a7hzJ0sTj
	fA6bbwmPIVuUtjk89BTdlspPmprt8iu6G+gQYbXxWEC0DX1L1dR05GyRutnxsW93cY/g58udOCo0D
	iiPO5bgMlKiP0JOuoEHBFiICkPjBjrZz998Z1Aw6OjqgVCT6wE07RCppZHO+WJzj4qtvHoepNgBxu
	dKEcFV62wSfWoIYBb3shZd+Dr7yzfdGeLUJMKPYS7x4xMhTSadxAj0jWHxwKIkm0V2yyrx1ztDf9P
	nyc4+XrJcRAoGoNGYFnrkHuNgIXy17MRxhzv0CnKehW8grdXA59SMNjGTji9q1Y7zj9Ft1aaCKJmQ
	k4fVdJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TUf-000000047t2-3pAo;
	Wed, 25 Mar 2026 19:02:17 +0000
Received: from mail-northeuropeazon11012065.outbound.protection.outlook.com ([52.101.66.65] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TUc-000000047se-3h2O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 19:02:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvZZVe3dKGsTfTMDyPj8oD9gxc0iyNmjqEpNLOkN/6bi4URL2/U4pmuwh+XNCwZC3SKd8YEYyFGOty844xeioHD2HphLg1PDvLMoVOZ6kFNfU15Ct5Lh8+2XXWtELiNRymqOqHWTeMfgadzQts7Lzcm9PrG8glcXtrWuG4N98d+grcgUil80y4gTGIeY6I9NbwUTJ7tjEnYZSMOomFOSc5svmUInIRfL519gua4P5aV34r8CLoWtKmMIPEQmzS+FhR6eOLTThFhcThpKqUmfuHe604okzc//jAr6zX204Wn/mmd6u3gWLzN+h00hFrNsRSPSaM6/XM6Gi5K+7BLBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX8itn9hZHsoDApBW80tjxpj7OCJtPoNrHD1ptQp5LA=;
 b=K+9KFxGo82KL7oOWiyjJbtoKYPnbb5MwZA5smj8jnghsUDX6w1WpmhLHcpECwyEBjUCLUR5PatlC9TuwSeOleekfKipKyp0UZsw1j1xp1gUbtzAbgDWWMVAmpOW6suKKIfC8HZ/oZknc6x8PULDGrCDetTgejEgvItrNNVHkRRqgnaqXdjdzapbfQVurFCnbuf4Rxepb0q7eH7NUAdwJC14dMSRqnnLEdtsdTh/86/wB6Z2Gy58vyRdWlJ7WOMG4oxsyOb5Lpgak8giXPzP5ADWibyW5MC6up6WhY3jvlUyeLGLQoekZ/e09SMbQq1GX15BVvqoLG+tDpvqIbknpxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX8itn9hZHsoDApBW80tjxpj7OCJtPoNrHD1ptQp5LA=;
 b=Gwzpnb6V/rQWCxsO/ioUKJiLhaDrlv+ZcICeHVyX3Ee0uXWtqKsYzby40rgi7y9jxl08Sc+MkyRNPusb2aPwZYkf4+wbD5OHMUsFFvMUh/zg7HfMiA31HsKrOVsIIL/T/ZWU13/IK7asGzJFTnnhcyrqBlVSDJlrf49e7XAwaTM4DmGJvC9cnH1h1DE4Bsk+3rXUQoDIJtB63TVtl/23DriAFr5zMdCdJfazUi+4+MsH5bJHzkh8A50TQ5NisdqXX2TB6wAB6Aquco94wNdnbVep4ogVrwuYxAeo2T+xuQCb9TDleYfxVaVPlPaJdGecIDg08ZTt0zYK22rdCQWO6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by PA4PR04MB7997.eurprd04.prod.outlook.com (2603:10a6:102:c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 25 Mar
 2026 19:02:10 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 19:02:10 +0000
Date: Wed, 25 Mar 2026 15:02:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata
 board
Message-ID: <acQxK4e4CzUWZiRi@lizhi-Precision-Tower-5810>
References: <20260313174707.26902-1-stefano.r@variscite.com>
 <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
 <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
 <20260325122104.GA19112@francesco-nb>
 <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>
 <20260325180604.GA2972@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325180604.GA2972@francesco-nb>
X-ClientProxiedBy: SA9PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:806:28::34) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|PA4PR04MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: be9ce971-0e71-4b9e-1c52-08de8aa10450
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mNtitSgNhJzFwxn8Veyu+ePGPX4va513KUfNJ+JQmC/cx9BQuC8GnKwPozW48tjwdd3dELw6zNg5GkYV15kW6QYe5l66jWCperyUbXaTYMxRcoXUDDWUCCFu4lwaxL32f9XnQupUHmywssp40qzPanbXpMwoXNXqYxpMatrR1f1x5WBRPwQtuVPW0cBzVzsWgsDrUnsoKddeUrCMeH8jZU+7D6XE5Kjo43eQGiF+ztSIdU+HkDvzYu3AsiFbxgXXryaxadXypq45v2g0/bGWHg3bBb3kHRl9uCQ1N9LNM29LsvwzE/yp2B9a7gs/zRUO0LInq2494uIOF+my+XKpwKUyMO5z29Yd1aNhsuj2apEMVtppOVuU4DWBui0NFJTF/6HYwbuDXpMAcA1U/9soWHnr6ReedqrRRSKKX4y2d8GnchOzouVqz31Er58VfyCjywD3MOHQAqb1qgEps9tgYQ6s7dGuq60Qgr6/RjMCyE9YbVJkxOoekHTp1DUbuibMgWjMENSF8lz10mTNJ2Mh+rJ2psPbpN7NfVAbBbXz6Pv2HHOUfa1jCDD3sXgqjd6P/Zmubi1ARhcMT/rt2gdzqPwktDeRzI+yfdXhiB8x2qMdCiNUYUKTIA+5ZsxYZL242o2rIsk7um7WvR6MrSvI6XdbCpmu7z2FhypuIRGduj7Ebkt5+55CZDb+KUhVDSh4kdZZyc5u2WlVkDADIxeYp7lEPlKcwp633GAldKfiTBQ9fJkMQrowZyIJ5Iyiw+WSGcWazpkensEGemJ9Eb7ZfttYX1J4HF+O2pqBc8v4T8E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FbOOw7u59b1cah+GHja2uAN0IUW1ESpdCx7lbehRrCpdg2QrBRb7NbPPygye?=
 =?us-ascii?Q?xO/dftbCBZaRHLy1nQCcETjU5atnOa2ua/Ju2hAL8n2kwQJat11w+p7V5vwK?=
 =?us-ascii?Q?/94TgFumNt1OResYsb9ba8gaP3uXD0JNgGQvRT+el8FNWCaFLcCtN5VZs+s6?=
 =?us-ascii?Q?eZLR1ymWp9sd+TAlFKEBDlIvwfP2YRo3RkN0njMVuqrXfpBPSiDAUc3zoQxu?=
 =?us-ascii?Q?6QBf5Kx6RmWNyzfdPqH9sKJlS6oaxp/GlCLKguscQOqe613XQht8Isa/Wh7x?=
 =?us-ascii?Q?+xYjLbmzdj/gblg/xy5rNF7bJu/U5dUpPNgr+06XZ16geStZZetUiQFY/Zmn?=
 =?us-ascii?Q?OnicLOqSQf41b1+3IecUZHcN29b9BrvrBC+OJNYq/T2Oqi3xP6i70SJKfZQB?=
 =?us-ascii?Q?rrt89I3c60G0d0BenibmI7BpLgCDZtZWybRiWL552W6nEmdgVgQCMyFRdFqb?=
 =?us-ascii?Q?YChJgrLVTU7K8BaNNqSjlKpiCr/ZacV4hTUbwLKQAqaJH8+qyZPdD6j7U9Pt?=
 =?us-ascii?Q?UIAYHCbb/TqUO1UvV4iTrKGr/mz9y+dFWVKp/vHogVM7rvSOfwxfkVDES7Ze?=
 =?us-ascii?Q?HWXKWi2c9BBntYQeRsrst8iN3GlvUck1g39p3S48zYz61oKsjvjUkZmxxO55?=
 =?us-ascii?Q?fFimYZ1o7w6uCjfOqEAFGU/DzVB230fCcm7wMeXgzZqFMRCMX8Jd+dr6shPv?=
 =?us-ascii?Q?DgOWlWgB19NDtwnA4F7cpLEr17zo3/07f3cbR5KuwmpN+rsUTnHRzQh3pF7U?=
 =?us-ascii?Q?J3CfK19rZjFAauRnBoYkNdCfSu0V9QtXrn1JHT2lgnFE7Y+QMfrpNWOpLaiv?=
 =?us-ascii?Q?9o7+wVeKvEGR4S2FnCLS8pmABYyebhNgCP29dH7JC1zHEUFsdh2CgTHia6Co?=
 =?us-ascii?Q?YAxWns5pWx1M8GV/9Iqddesr2VqlPhSGBeNQGyrXW1IleyoUsoSLC0pBagbP?=
 =?us-ascii?Q?uxS9LYRqBd32Fs09XEU0MPyaWaPATWSyOvVkZx0MuWw6PBaQu4a6dyAMmdNf?=
 =?us-ascii?Q?yp8u5w9pyjQSAFg7INb/mepUdgIihGygKxMnOWEAmSnMqEEcq9lZq19eQAlW?=
 =?us-ascii?Q?c7n+A2lbEe86bZ1My4fNOEV2uAaTNYb0QGiOqGRCmwrKdU0nzQxMMjR94886?=
 =?us-ascii?Q?qrrCIAsqQROZs7HT5w2RqhC4QFDePurH8TCiDJW0s/54pemz7Vn+a33uTxL6?=
 =?us-ascii?Q?ZsAeZ95wl0/wYatc77PP5t7+wjurlHCHfT312Pk9Qs9XYXbRvky8M9u5NipS?=
 =?us-ascii?Q?3LglmkySpopN/d2ZWBvkZ/4speludeQY1ZcGij1YPmuJdiOBTu+z3Gt/I/dv?=
 =?us-ascii?Q?06KYmxX75Q2QIN2AaI+iErqu4yS//QAO3hkJo+GjBfBEQwGdCjpe+tg67FGw?=
 =?us-ascii?Q?0Jexeo4uJKEAGbmaGlboCA8J5hiVMBI7kq8hwimoiy25Ro/WOVeBkCRjw2X2?=
 =?us-ascii?Q?v1txxMSuX1VBaVHGvqwlw8/usyKeugIJVcI3w8q008bSJYscoLxJA+62H+Kr?=
 =?us-ascii?Q?Q9Qu0WhL9vJmzLGxm3ndq08j5qKXr1TwS9LiO95azefEdZpu0cXDmNkhQX8E?=
 =?us-ascii?Q?Kl6kMk2CrhKDXoHRPYV7PcJZYqnjD5SRmjm6H8xRi8cQdNPeGym1PZ4tTB4x?=
 =?us-ascii?Q?nnsgNxuyndZi/cpogdux4WwRx/Z/g1QGkrmM4Zxf5weYoPVmQfmYqP2OB9ff?=
 =?us-ascii?Q?WhxLb3j+xd7YpoBz0mVWIU33NLxIZfE04IOCIrcPYpv2FaJN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9ce971-0e71-4b9e-1c52-08de8aa10450
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:02:10.2778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaQ2ToEsh3jnc9j5EOFim/K7THCyna55Wh8gtPp+JMquZElTKNn/NdoufcMNpFUvDO+eSOKQSy8hhYoAQrDx5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7997
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_120214_941982_EA01B193 
X-CRM114-Status: GOOD (  28.43  )
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

On Wed, Mar 25, 2026 at 07:06:04PM +0100, Francesco Dolcini wrote:
> On Wed, Mar 25, 2026 at 10:50:57AM -0400, Frank Li wrote:
> > On Wed, Mar 25, 2026 at 01:21:04PM +0100, Francesco Dolcini wrote:
> > > On Tue, Mar 24, 2026 at 03:48:29PM -0400, Frank Li wrote:
> > > > On Fri, Mar 13, 2026 at 02:56:03PM -0400, Frank Li wrote:
> > > > > On Fri, Mar 13, 2026 at 06:47:01PM +0100, Stefano Radaelli wrote:
> > > > > > This patch series adds support for the Variscite DART-MX95 system on
> > > > > > module and the Sonata carrier board.
> > > > > >
> > > > > > The series includes:
> > > > > > - Device tree bindings documentation for both SOM and carrier board
> > > > > > - SOM device tree with on-module peripherals
> > > > > > - Sonata carrier board device tree with board-specific features
> > > > > >
> > > > > > The implementation follows the standard SOM + carrier board pattern
> > > > > > where the SOM dtsi contains only peripherals mounted on the module,
> > > > > > while carrier-specific interfaces are enabled in the board dts.
> > > > > >
> > > > > > v7:
> > > > > > - Order nodes in symphony dts
> > > > >
> > > > > Can you run https://github.com/lznuaa/dt-format for new file to easy
> > > > > track and check by script later.
> > > >
> > > > I applied with below change
> > > > - update copywrite to 2026
> > >
> > > How do you know that the correct copyright year is 2026?
> > > The copyright years does not change to today just because it is the year
> > > it was submitted.
> >
> > At least it should include 2026 because it is new files in kernel
> > tree.
>
> The copyright year is not changing nor being updated just because you
> are adding the file to the linux kernel tree.

It is impossible zero modify before submit patch. If update copywrite year,
it needs include current years, I omit it when review it and find at apply.

And original owner Stefano Radaelli's agree on update to 2026.

Frank

>
> Francesco
>
>

