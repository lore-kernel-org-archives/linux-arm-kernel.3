Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB20C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 03:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9tnEJ/q9SqoZwDKpEd/6S/x08VO6I07R7EGf4WulLg=; b=T2Uw99f9l9qOxSbXutI/q0/cXy
	DCg1hXRcabz/NY4dj4ioOsLvJFOzQ6q6EN/LBGxUc6HpgDwwjr/SkMcwZNa+emgpsC8nK2fL8LsDj
	cM0Y3Ky3eiPy6pVrsWpOz3dBdnlru/pmlNXA1YGCIVpkhoX50MaFly7puzLhJX2V9pkkEgjgmo3qY
	yXQGGlmm80A9nDLyfTlskFmQkiFjnyfP6xolcyKppJEvolhmTP60QRhgQVM6BghZ2kuc5GoLxWsBg
	mqJkc0Mw+eJMKmh2s0DyBqnf84GUt9zh79wpaPGPjJCApjPIlSj7lgnbgPD/LKf5ifIuSA7uGYU+Z
	x6U2ZfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOTNZ-00000003M9I-0c2d;
	Mon, 09 Jun 2025 03:40:57 +0000
Received: from mail-northcentralusazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d111::3] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOTL4-00000003Ls9-32ap
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 03:38:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNdGyowg6d7QWkTskaAiF/CVlKJJE+hiFUjsriAfVCw7aNTO3nycok8LQx3HMLOko/1MpkUQVQZs33/mbPWCU2g+jP9CJ4lMyeq3o1UBrjOzTfeTA6bVcYhc5JcOWB8QjzPyFXSRsZzBl63TY+JHZvwiB9UhjbDKxB7klFMyrZ6D+Tm540vcuDHJtItnzhvU0Vnv/nWKTD5fiiTeckae3I6raDiiBDvt4t7MsA0C5E1EDfaL9Mz3fGfPwSyrJrrRDcffVbOHq+na29ddkCkg5MFCdCqrfZS0YiuSS+W3xtVDQDOmKBjFyi4H3vFEpoV2c5DUu5S893f5NW+aAYaSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9tnEJ/q9SqoZwDKpEd/6S/x08VO6I07R7EGf4WulLg=;
 b=y+N92OIwtGf8lgPkWIQfAnFlSccHipgarYvzCfjJYts3hgHZZN6WalIFRGqKAFKTiEIY5zZh5mKtgTvGuA4/mjpfnVcJkNhWf2r7jtyKOSd3xRxYb/hxtX4URuUgYhf9MHU9GY6oOBr2OqkWnWeT9skl7pMXRSN8dv21DFNTsX/WbXjVsb78MdTpXVUPfGvMZHBtuKQvH1JnXk6S+RlsY+reOaBwelhx+6GSQcLkvFO46qq5WzsFNfEPVZ1zzuCOl10r97Ou+D9icDWI8WZvuW1SuhXiQxPELvJBDulilG612tle8gVv0ONt4eLjSSUIMTcIaKtuPh7aylMEdr54FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9tnEJ/q9SqoZwDKpEd/6S/x08VO6I07R7EGf4WulLg=;
 b=iKSIGvgJYiGFfbgy8MM9AT8O8XDXYbUiwMQSROLN5SVVwL0xSxFQwytppGIMDamEBV+F/B+XMCITDD0nI88r3xlwNHE4v0yWymKIoJLZRgt8OhxxrxYhsGBEmDziIBrWmo1IKufoaH+J1ayLYbPhkJAizqgj2OEnoOl7HF+RoZgeAPr7tnTc//6fpVMAiYOfRELk0IR2JfZHT8YzIPjo6QS0crU03st2OrTo+9d/aLkHHc5/rUargMczivDnhV7uB5Y9WaCyCIkpMTddbDaBHykuUMjikxtPfeG0A4QPsgqfxkZzm2zzwJ+izR0XuJJTrJrR5s6McvozKTjjfdVm+A==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by LV3PR02MB10643.namprd02.prod.outlook.com (2603:10b6:408:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 03:38:08 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8813.016; Mon, 9 Jun 2025
 03:38:08 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: John Ogness <john.ogness@linutronix.de>, "Toshiyuki Sato (Fujitsu)"
	<fj6611ie@fujitsu.com>
CC: "pmladek@suse.com" <pmladek@suse.com>, 'Ryo Takakura'
	<ryotkkr98@gmail.com>, Russell King <linux@armlinux.org.uk>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Toshiyuki Sato (Fujitsu)"
	<fj6611ie@fujitsu.com>
Subject: RE: Problem with nbcon console and amba-pl011 serial port
Thread-Topic: Problem with nbcon console and amba-pl011 serial port
Thread-Index: AdvULbS8DdGjT9TLS9OOSVhbv2AtDgAN1+gwAALFDgAAAfWTAAAeB8NgADP4FvAABDFXIAAHKeQAAL9pDfA=
Date: Mon, 9 Jun 2025 03:38:07 +0000
Message-ID: <SN6PR02MB41578CF81FC4C831C02525F5D46BA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de> <84plfl5bf1.fsf@jogness.linutronix.de>
 <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <SN6PR02MB41575419E1223B8A8B0A1F1FD46FA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <TY4PR01MB1377757DD5E7F27A41F0B4723D76FA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <84frgevdl9.fsf@jogness.linutronix.de>
In-Reply-To: <84frgevdl9.fsf@jogness.linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|LV3PR02MB10643:EE_
x-ms-office365-filtering-correlation-id: 28b79bc9-15a8-4fcb-c05d-08dda7070ce0
x-microsoft-antispam: BCL:0;ARA:14566002|8062599006|8060799009|461199028|15080799009|19110799006|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?ccu5HwJY9s5ykIKPR21/vE1y+pIqm9g54VspOTT1w22jVLI6mwzw8B9BwFlh?=
 =?us-ascii?Q?zUWwpBQuQWTksyFJhVgcmP/e+Iz6NoEN+qzWqqMilQwMAnRi+n1cqYgHZ414?=
 =?us-ascii?Q?F3y4zrbEA8QVQKudRyfQhg0VWziJo1D2MF2OS3jyE09VGvyCggs5RMdxFSO5?=
 =?us-ascii?Q?6AJWFFagqOhFSDl/SjkA9ykek9jd7SXTZ98v2cl/SaBnAJ54fRVU1tImcGf0?=
 =?us-ascii?Q?n68d2z7DwLs7mi5kmckxeahkfc+yJoI3cJYQYTwZ5EHuFWEF38as+XWq6270?=
 =?us-ascii?Q?xtQ+ou4Am1dPmD1hKTOX0Epe4rKf1uWjF0KOQD3E7c0vSUReJs7tddD58zCQ?=
 =?us-ascii?Q?YwyZK6J07hpLSN+xVaLnprhw/WBGkU4WRWOtBen1MnrphlhrB3N+TETmrEhT?=
 =?us-ascii?Q?V3qJcc+vd0U+PPHRFmwpgX5xMxj2vW0IQ0A+3RPVg5Ur0EJuCHvKPtoL/NBg?=
 =?us-ascii?Q?1+6h3OnC5iWEFaWh9sfgH6VOeoCz/1+4HIMIv176Gyj7PRLJd4JHdQE5igro?=
 =?us-ascii?Q?hndt4RrXCU1AlFBRZ/GxY+8cDha0ROxZV7X3Um7M2lxLPVjxjwg2OJhkd2tj?=
 =?us-ascii?Q?eQC+3Y1rFW6iGap4Cub+ba9JPu1dp79F3zxKY2s09RlAXnEmXz+3rMThU+Od?=
 =?us-ascii?Q?VdVr9SVgjrb/poGnrJ85GlY9R2LOFIdXMQogBNARhiZH5/kvphwFT7T08tIa?=
 =?us-ascii?Q?JX6eFMxGMvQjOyoUZ8EvqkmypLNo3j4nEG1AexHFYSM909GEtIlwxl3AD5rF?=
 =?us-ascii?Q?QJV9KKDCJl5ozuJhgPUiifMC2F89R4AU/ymlYtrhnihVzBv6UOOx+bFRwWS5?=
 =?us-ascii?Q?FUAVF3XOIU+Ghdexx1lxnT/E6xaMhjfThpGweG9pJO4nEfMqa2TFYhZn/KCK?=
 =?us-ascii?Q?YtTx8kXYVjLDd90zwemsnAC8Npj+LOtWLVGddGKbtzb/E4LREebiDcv+u+XR?=
 =?us-ascii?Q?B2vz5CwJNXSDiDTQ9CgyI5Lk3xovxd5N8ttjPZt/ZhvjGIj8bkYRHHolK3T0?=
 =?us-ascii?Q?m+eyiMKWKk/Kfj1xOEVn8Tq0AWo4Hl5eqzMPGdwREw+z6oWfXI97qCDra+2Z?=
 =?us-ascii?Q?IIWA2s5uYSQQnKPkIjSaXTfbiqXrKg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?91+VivNKXNo1ThFsz7GJh/zyB+9F9DPPl2pjEQp4qYHnux1kuu5eYnCx57g8?=
 =?us-ascii?Q?rdOAUATWnw/N4A+4Yslct/JCx4RwOEdFrbHAWChBv4mrpliCPDEC0iwzuNIw?=
 =?us-ascii?Q?LeIlf+9051538rh5GG7N+K9A939e2CttUfRgkZpIm5CyvdbZ4uKgYZBrfA9C?=
 =?us-ascii?Q?LWV5/iRcXBWtNjMpqb/H/MalcG1GCwAlxbqBiX7MS5UY+hrythcX8aZN/nzp?=
 =?us-ascii?Q?GsaMJLdba5QjSH6C0gr8lstpku/b1Vb2qsjBm7dDlb+L8Ww4kI0NMV1rWtep?=
 =?us-ascii?Q?OYTVR1L2AXnU35gj/4hAQRNXAcz92mSjTakFB0n7nv3/phBy4w/SWbSq90cN?=
 =?us-ascii?Q?bRk47QKtPAGDbsii4MAA2KE1Jtvqob64liQJDmkdKzh238hjOmC4425smn93?=
 =?us-ascii?Q?7ZAqMNBDo98FCIu8hwmZPQoaspBZ4k++tb2ykSu4dfqSPs8AfMNeuOeabUSo?=
 =?us-ascii?Q?cj8ezqk975PKgQtWK4K3l9GLJG4gWFa2cB6ghkOSs1A7yBZRMg+qrYWSJNA1?=
 =?us-ascii?Q?/nVbMz+99s1b5c93mGZug8OR+qbleJyDqBhIjCBnXR3fezcEGXMXYXPVEltf?=
 =?us-ascii?Q?aNiAliLUhxMu02fp1yY4q07UQQsIaMTkfsCfiMg4jKI8+l14YdxZjiRGXS+s?=
 =?us-ascii?Q?tGmKyuHHQQrUjcpyfkPglVqjlVGsxYKrIrXm/lgIRyvQoFQpd7jHWCk15DoQ?=
 =?us-ascii?Q?+q4Rp9q+9pBpIGKbb6f1TcTp4bIc9Gh7v57FgoHMAD72g+hg/qblzzYx6JDP?=
 =?us-ascii?Q?97VfNojjZeJw1T8W8ZfQ+yL3BKvaxWL02QwVVYFXof4F8TPMET9Alvqh4iNR?=
 =?us-ascii?Q?KJ4eLDdFqJSRtvlhBCaqHxY+FZMFhUa/ljpRku9PDkrBxVqgPE1Ki63y+/oM?=
 =?us-ascii?Q?P+Ys/4WWBPsypwsXNunE8mQ8vsSTj8KrlHgJFxSzhXvgmqhDM0TowAaA4aAx?=
 =?us-ascii?Q?RzXhKRG7H51HxB5G078SK18larf3dkBOhIBxZBs/qJ+vrr+LLgljGQwsOfwr?=
 =?us-ascii?Q?xTCFmuO7mBvQj+aDphs4gLfZH/kWLdvbS3rHMz/G9yFW3se1impoa7BhWeYg?=
 =?us-ascii?Q?sxjRxbBM9DMPURGdp0JeVSp3XvP/428cboC0lm6+YZyds+huTJVwi6mHG28l?=
 =?us-ascii?Q?uI0T+EbQaRNnvf35Z5CWw9knvqk30sDX2Y+pRwfHZmVwcKncxg8tuQt0LJbh?=
 =?us-ascii?Q?91CTj8bTiFNxYKB+Vj7ALfMlMls++wIEFV4o0Jtth5pqU1NEeulBrFQOvys?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b79bc9-15a8-4fcb-c05d-08dda7070ce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 03:38:07.9067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR02MB10643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_203822_774463_B7D17105 
X-CRM114-Status: GOOD (  35.26  )
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

From: John Ogness <john.ogness@linutronix.de> Sent: Thursday, June 5, 2025 =
12:43 AM
>=20
> On 2025-06-05, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
> >> I've tested the fix in my primary environment (ARM64 VM in the Azure c=
loud), and
> I've seen no failures to stop a CPU. I kept my
> >> custom logging in place, so I could confirm that the problem path is s=
till happening,
> and the fix recovers from the problem path.
> >> So the good results are not due to just a timing change. The "pr/ttyAM=
A0" task is still
> looping forever trying to get ownership
> >> of the console, but it is doing so at a higher level in nbcon_kthread_=
func() and in
> calling nbcon_emit_one(), and interrupts are
> >> enabled for part of the loop.
> >>
> >> Full disclosure: I have a secondary environment, also an ARM64 VM in t=
he Azure
> cloud, but running on an older version of
> >> Hyper-V. In this environment I see the same custom logging results, an=
d the
> "pr/ttyAMA0" task is indeed looping with
> >> interrupts enabled. But for some reason, the CPU doesn't stop in respo=
nse to
> IPI_CPU_STOP. I don't see any evidence that this
> >> failure to stop is due to the Linux pl011 driver or nbcon. This older =
version of Hyper-V
> has a known problem in pl011 UART
> >> emulation, and I have a theory on how that problem may be causing the =
failure to
> stop. It will take me some time to investigate
> >> further, but based on what I know now, that investigation should not h=
old up this fix.
> >>
> >> Michael
> >
> > Thank you for testing the patch.
> > I'm concerned about the thread looping...
>=20
> The thread would only loop if there is a backlog. But that backlog
> should have been flushed atomically by the panic CPU.
>=20
> Are you able to dump the kernel buffer and see if there are trailing
> messages in the kernel buffer that did not get printed? I wonder if the
> atomic printing is hanging or something.
>=20

Getting back to your question. There are 24 lines of console output
in the panic path with sysrq, up to and including the "SMP: stopping
secondary CPUs" line. The nbcon kthread starts to output the
first line, which is at INFO level. Then the panic() function outputs
the 2nd line at EMERGENCY level and in doing so it takes control
of the console, and re-outputs the 1st line followed by the 2nd line.
The panic function then outputs the remaining 22 lines. What I see
is that in nbcon_kthread_func(), the call to rcuwait_wait_event()
completes about 80,000 times after the panic() path takes control
of the console. That rcuwait_wait_event() stops completing sometime
between when the panic path calls nbcon_emit_next_record() for
the 2nd line and again for the 3rd line. Then nbcon_kthread_func()
remains quiescent as the panic path outputs the remaining lines in
successive calls to nbcon_emit_next_record(). Of course, the other
CPUs then get stopped, and the kthread can't do anything anyway. I
haven't tried to track down all the nuances of the expected behavior,
and my custom tracing has limitations. But maybe the kthread looping
behavior is as expected?

Separately, I see that you have posted a patch that solves the
original problem in a different way. I'll test that tonight or
tomorrow.

Michael

