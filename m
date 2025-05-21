Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A633C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTAG9DlCiu852RhH2SB+zmVVSOyAKmkh3iagedbB5tU=; b=tO3qdNBKp+k1eqruaHHKJ/JqZ5
	bDJqW5qtu0fU3fZACqQMrphOpJ/zaKCsb7UZpgy5IgLL0S/34IAX8JGC9jfk2J5Xmi8HAT29c5sju
	B0U31ECy7UN4z9+uZu6jS1pRyoPc5128MT/SFO+zh9czStTgRbd+ZTFCBU2mUfxfKS+VGzb9whvMs
	IuZzfpcQwZpC98ObBw3Zr4Dywyqmt51/L8O+TtCqBc1Swm2Wbu/Q3D+f+jnq30XQEo6BT22lCBuf0
	x762mK2Mp86WJ80EQ/W5+8FhpFcasqNkBYTQBWD2qRelkTX76PRGQrK8L/d6pqha9XTFvADbFFPJM
	t+dOcMaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHki7-0000000G9lo-11s0;
	Wed, 21 May 2025 14:46:23 +0000
Received: from mail-dm6nam04olkn20812.outbound.protection.outlook.com ([2a01:111:f403:2c09::812] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkfx-0000000G9UD-0Rc8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 14:44:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2KqJ8cDD47TlIeIOpkLya++RiVASD63mW0AVsNNg5e6HO8AjTXWYYvf+y+ciDj8MKgSwPsEdwpDQMZJ4o168eXJo7K8j/YxbX20sEe0o52gQF0rLfGwS+qfnt/sXHWBhU42w8MRVGJX2VtBMI0wdiTRvkMf9YEwHQeOUDnsbV4mZgHebSMJYs3MEc/ntKvYZ9uq9DpYHfupmigu/UkSlfWau82WN/4cTdfhhIuqLg7h3ToSNjLak50S8qsbsNWOIBuwxT8UX7bkFO9tCG3AvqK9ei0cjncgHIrEuOX5PLjBDT2Kg0NjetRknRMRYmyNI5YDUzNfMi1oRI3RqpD8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTAG9DlCiu852RhH2SB+zmVVSOyAKmkh3iagedbB5tU=;
 b=jVeWwFXKz5Am6F3HdAT9GrBZIyNx7EQI3JjknVjDHonGcrSdp4AIHMLfbylyCyUOXGhrVdL/LAnXU17XH1yqQ42pQhJF9JuAnmVjBYUn9T/UkTvlrMda1YhynlHV4GEsIJOwkXkbN4ze0VEDLxTgw7DRN6c40+uhkWpt5xgklKeW0BTd52KFs1Qwa0ucJ2Xh+RuwKL+CPl1O3vHkIjSW3UH/6hlMkqrcy8ZMvJJMeNrSclzaiticd4dZEzUMLNlNo5CnA1LOaqrbFyqnH6KY4Fo+TfN3oWi+9iOJxqSPE6JME2XUPqLTTzzJBZSEmAka+M8z0jvSOK8MvYh8s0ECmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTAG9DlCiu852RhH2SB+zmVVSOyAKmkh3iagedbB5tU=;
 b=q+LYHsonf0OktJGcyOMBUkPyGonFLrU1CudsFhMkfmHvFpK3cLD0A/baYyMJUYOb3whM3UWtb09M7vumJAcAImWWOZuH/lVffTkkjdAF1aNwrBQK+PBcvxZ6zqmzhHcVR/aUG24Qq3UP2YDHjBZ0mJFkZnh6fdO00hXm4JbSxHeZsMRQEeS4JqqS4Tapsgjag4r8RNeNChljEG5piSiny0YIFQ7zba9uz+bGv/jSHZvtkp4RIK6oMQQlzzfigbOt4sb8dTrbiVTtF/zt/cT2q+lBn//OIx236oRsCgbV/fThmc+skbFMYlTnpbgNzddEjsn74TaGu2VfrWCjAwwcsQ==
Received: from BN7PR02MB4148.namprd02.prod.outlook.com (2603:10b6:406:f6::17)
 by CO6PR02MB8722.namprd02.prod.outlook.com (2603:10b6:303:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 21 May
 2025 14:44:04 +0000
Received: from BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::1c3a:f677:7a85:4911]) by BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::1c3a:f677:7a85:4911%6]) with mapi id 15.20.8746.021; Wed, 21 May 2025
 14:44:04 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Peter Zijlstra <peterz@infradead.org>, Sean Christopherson
	<seanjc@google.com>, Nuno Das Neves <nunodasneves@linux.microsoft.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, Juri
 Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, K Prateek Nayak <kprateek.nayak@amd.com>, David
 Matlack <dmatlack@google.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
Subject: RE: [PATCH v2 08/12] sched/wait: Drop WQ_FLAG_EXCLUSIVE from
 add_wait_queue_priority()
Thread-Topic: [PATCH v2 08/12] sched/wait: Drop WQ_FLAG_EXCLUSIVE from
 add_wait_queue_priority()
Thread-Index: AQHbyO/u4dGyNPKAQkyMYO6LuyJ7vLPb5gAAgAAyxgCAAOA7gIAAMB+A
Date: Wed, 21 May 2025 14:44:04 +0000
Message-ID: <BN7PR02MB4148503E1599C1310F408863D49EA@BN7PR02MB4148.namprd02.prod.outlook.com>
References: <20250519185514.2678456-1-seanjc@google.com>
 <20250519185514.2678456-9-seanjc@google.com>
 <20250520191816.GJ16434@noisy.programming.kicks-ass.net>
 <aC0AEJX0FIMl9lDy@google.com>
 <20250521114233.GC39944@noisy.programming.kicks-ass.net>
In-Reply-To: <20250521114233.GC39944@noisy.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR02MB4148:EE_|CO6PR02MB8722:EE_
x-ms-office365-filtering-correlation-id: cc0e37c0-73b4-4829-6a24-08dd9875ef15
x-ms-exchange-slblob-mailprops: 7J/vb0KDx3hRy7lV+CYJkolW21Iq60BX6PUWK5vDQoybldZ+522gbMQwlIyxBn0ibYkxOXso5Ekmqtp7vqNbJZE7xjBoNjoQUGj20xKZFGOs08mS6F0A7qjf/ychbTKBJ5FWs80udI53ou+lIk+ZIvnM/aB3cELdAdeFKM+wx8uwK8Jf5L5hn8g97HBhcF2TM6eGjeeSZV81K19tQqsY7/s8uyR5ewfairvfs0Gd5LNrJHXv2Q6yut55cLDVaMP4+C9GncN9Xx5uaMA9FWHeLgsKrP5yw2DjqW7jCwVNo93kOvTaLcCRWlUOq3GKa+wSLvePr6GIInSXHyqktYJWRvUQRqT1p9QOwE0HrMJkAMPZHPfLpN6/npgIcjNVH1rx1NPi0fqa1jYfnzqQ7Iuk3a6TyVQ9QIVdubcSfawXsxsO0L7nsJhKhhZbnVpTc0e3UfPd3G8VjoDyoqBVivQhA5CXPMllCl7icdvI5aXlHzmPY4wJAp9O+j2IMZ9n5weInBhG3G8UpmQCNN8jOXyGzO2b3X1rJaHcrhHPptHs7s2FaLr0KDTJ4XXQXn2Hyo7sHazv39Z8DlM/zL5rSc2XF88RBJm1zznt1yNjOjL8JXgEtQTlvt8gS5q/y3e66N95asAcUCRRfghZOSDwDuvLna+j9isOVFHqRXHd45dsUn/+9yM4hES5SYaDcoop9yg1LFjeGDu6jWZyGqoCGNy3jcJ3FmoJOob8BynJ4uxe90Kj1dwzcBF8nFjFaNz8JyxOS+T8YszG36hHNnlYXEp0/5KWyMEKbgXgAtLsd0nLM+Q=
x-microsoft-antispam: BCL:0;ARA:14566002|19110799006|15080799009|8060799009|8062599006|461199028|3412199025|440099028|11031999003|12091999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?mJs26c8eFNMqG5Ruo44qmZ0iTnncdG7SXn+nG5NJAbYN/YqU1pOoFpJk/spy?=
 =?us-ascii?Q?OQr7xPO2cP9I0ZZYuOoUyAhEBu3xLVkZkWy7IV0JWWu5ilkkDxOTUhlOBWqY?=
 =?us-ascii?Q?iyljKUeSKGaOVH1uHV5pw/ndTFgSY8diNhXpdMd+9aFr0MgO5wr0pEUCMPCy?=
 =?us-ascii?Q?2M22KPMcWBvbQgK4nsXPa/dhab4Kl/fB1yLOBuI568cCgT2eetjlaDaAC0DE?=
 =?us-ascii?Q?mP8LmvhPLq741EGXL3VXsf2uRz8Fpt/xHtdNclqEwpda3z8HQ++vfTJh4NMU?=
 =?us-ascii?Q?F1iK6Fv8wkyJQCob0LtM1w9KcosFoaeB74SnEcbI96/0+YvwiLTIzLJBYJVF?=
 =?us-ascii?Q?hLs10jDYS/gQHl8EizhGX3hWngjFL5Ucd94+5GuGo0owi5OIrrk0ZVwN1Cgg?=
 =?us-ascii?Q?OUO/sjxL3Cj+N8slJAn1vo9dSPlI2hN1paNhQrIo8QnCc5wW1c6DJ9TU1PQa?=
 =?us-ascii?Q?FeOhRFuNHxm66IUd+yF/fRKot/SNwcnTowQJJYQRh1YEIIdDvhd4xBeZdqf6?=
 =?us-ascii?Q?a/MxDT52PedjC5Tuf4gwZMl1OhyJpiatweVRg+O6PIjehCUQLBOAx3jMETyE?=
 =?us-ascii?Q?GTgu6xxpo+4MSmS2f7RSgu7zmaV3vTDpBjyDnD/dPRMkLphmpUlSat6hW1aj?=
 =?us-ascii?Q?Q0N7Z6dpEWjGhQrY9phjijY9bI0Rc+UyjSl9x0Xn7l6pIVIzN8ijV6qAbLYk?=
 =?us-ascii?Q?IKHRZ4i7BIvGzcj7E0b19weG8bOYGgbxGB5fS31KBZwBxxtoDhB5qXRRw8vR?=
 =?us-ascii?Q?Xcs3TGyHAO4QDuivcAy5AnY9Q0iR0iQ1blWaVmKvyCG+n/WGX3QUBSr83Yvx?=
 =?us-ascii?Q?JUqrvz+xAOe5EfqoL2jjyIYIFkwpuPde57QFdAaiORlacSIaV6LB6lBbzKkG?=
 =?us-ascii?Q?uEw+gpkdL4VmAHzynRe/jPmEpPA2ROK392izUWN2JyhmTMHZAfQ+NheptsMs?=
 =?us-ascii?Q?ZAeIJntW94jbpKfzf/oKKp/ICuIWC0KIQ2ube1+HX/19wVDvir/vHfOwwDrm?=
 =?us-ascii?Q?Le0acbVggqjrWj1wQIgNeP1jYHalTffSQieGlCUe/d2nvbE7IOJe1A/nnvQq?=
 =?us-ascii?Q?mgD56U1jVQqwKKLjnBdTSWi4UMiwh+Opm63qWnN5+XJkL7bweB6emJXn5mzp?=
 =?us-ascii?Q?ZPLsxVJ39/fLQMn4t5FX1avsFfyOBj/IfQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fwC879NcSwQeuRZcem3YXJS1jQDgFanjUTz1wvne4eSBrq8L8B/CaJpwdIXr?=
 =?us-ascii?Q?JoG/I1d0IRi1Q/r5qAMoY4S4HbkCvzaMbIMTSHKTiNGi2gvrMqMe4xzPYpCO?=
 =?us-ascii?Q?WP1jPbHwJW13ccxYzozxuHBI3xYL0csW32zkvlqj/GS8X1qoqrvtFDVT0bJ0?=
 =?us-ascii?Q?p69U7afkCWMi/V0sTuXP0wwo9bDxjrevBNCI2XhxpBCAbn/d5qB5e3n9T7Jp?=
 =?us-ascii?Q?7z5QN70AxPtXuFadBrYsRtXg7i0nUg5pfH//iyA/XmFCd48XXEo77A8uwjhx?=
 =?us-ascii?Q?dy+NmcYMmxkzAT19JtSgLfMFJopatCI7aJx8mQmF9xbcyVxsLd/vJBUGrFi5?=
 =?us-ascii?Q?Kn7d5UnroKgDZ4MZFVO+URqNYMox9kBHcYct9hXxj/d1EKL/ZpecgJ9N/EXX?=
 =?us-ascii?Q?2XNT+eHM8bVHwQZjhX/MQt4VtqXpCBJNNSqHSLwndbpg1eaiNMTbq8SROngb?=
 =?us-ascii?Q?2iWe/fTZsi5uke1oNpsHpOlQawlLYsThY4AI9pXA8OYh+2lcZ8Tv9MEPP+6Q?=
 =?us-ascii?Q?e/42+n7aPVtaAh+9+TO6LxyvSjtQcdEOlX1gCPRf4StVX4aTYnWraEBgp8u1?=
 =?us-ascii?Q?c9THv556f8QXWU4x3+5z5io/wthwvg9lkn4KL3m5we3wL9zlkrfbjxA5QGJA?=
 =?us-ascii?Q?Iix8td8Mmb5BgA+VEyGpPnRnDZiCz4VZORv4wSAZfMVsAXdCwY1QzMOO6ASf?=
 =?us-ascii?Q?T1ffqGBLGIGXjDCjTRJEwREl6HrgXLwZrZl0Tfygxxk0UjW5byGTPxCTCyB7?=
 =?us-ascii?Q?Hv2/8XQSk9T1wlkyGeFYs4SrwZk5qn1ILPOECgYixqdwQ/MHQAMMSiJM2b3U?=
 =?us-ascii?Q?Tn0ZwL5IM0sqzS3uWM/MMDeCYv9Ox2MwyBT88u6VtUO+dj8Kox16j+VfRX4s?=
 =?us-ascii?Q?lJshEw0f+xgaPO3IdsaYT+smE7GGJujdsSn7pcXh9loVqE4CSE/k52whHWNB?=
 =?us-ascii?Q?KkX1ovCodS0aWfe3XAweClMK8iCYEMm3dYpUFaoCvYGmyopEFPYHhRWEjLSO?=
 =?us-ascii?Q?tZ4wXPvBmllaN4o1m4sZRlj1UJGhiLE8mLi2FYdG8mS88zHqGV+FADBvMc7q?=
 =?us-ascii?Q?Z9AlS/WZmdgnaYwyCWMbQn0lAMtj0P1Wt59GoSFHPvD6AXP5PNCvU8NxVwRm?=
 =?us-ascii?Q?9XHctv2CPaGbhBcySka7y3CwIywvfH5m7UQsCKu0WjpoDPdFAdG86hO6u8gs?=
 =?us-ascii?Q?niIJse/H7S8M3XDPA/QHE/joyLphIXLbkInVkGxGx8TDiNJTPrqVR/scwwQ?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0e37c0-73b4-4829-6a24-08dd9875ef15
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 14:44:04.5791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_074409_139123_EE05193A 
X-CRM114-Status: GOOD (  24.16  )
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

From: Peter Zijlstra <peterz@infradead.org> Sent: Wednesday, May 21, 2025 4=
:43 AM
>=20
> On Tue, May 20, 2025 at 03:20:00PM -0700, Sean Christopherson wrote:
> > On Tue, May 20, 2025, Peter Zijlstra wrote:
> > > On Mon, May 19, 2025 at 11:55:10AM -0700, Sean Christopherson wrote:
> > > > Drop the setting of WQ_FLAG_EXCLUSIVE from add_wait_queue_priority(=
) to
> > > > differentiate it from add_wait_queue_priority_exclusive().  The one=
 and
> > > > only user add_wait_queue_priority(), Xen privcmd's irqfd_wakeup(),
> > > > unconditionally returns '0', i.e. doesn't actually operate in exclu=
sive
> > > > mode.
> > >
> > > I find:
> > >
> > > drivers/hv/mshv_eventfd.c:      add_wait_queue_priority(wqh, &irqfd->=
irqfd_wait);
> > > drivers/xen/privcmd.c:  add_wait_queue_priority(wqh, &kirqfd->wait);
> > >
> > > I mean, it might still be true and all, but hyperv seems to also use
> > > this now.
> >
> > Oh FFS, another "heavily inspired by KVM".  I should have bribed someon=
e to take
> > this series when I had the chance.  *sigh*
> >
> > Unfortunately, the Hyper-V code does actually operate in exclusive mode=
.  Unless
> > you have a better idea, I'll tweak the series to:
> >
> >   1. Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() and have the=
 callers
> >      explicitly set the flag,
> >   2. Add a patch to drop WQ_FLAG_EXCLUSIVE from Xen privcmd entirely.
> >   3. Introduce add_wait_queue_priority_exclusive() and switch KVM to us=
e it.
> >
> > That has an added bonus of introducing the Xen change in a dedicated pa=
tch, i.e.
> > is probably a sequence anyways.
> >
> > Alternatively, I could rewrite the Hyper-V code a la the KVM changes, b=
ut I'm not
> > feeling very charitable at the moment (the complete lack of documentati=
on for
> > their ioctl doesn't help).
>=20
> Works for me. Michael is typically very responsive wrt hyperv (but you
> probably know this).

I can't be much help on this issue. This Hyper-V code is for Linux running =
in
the root partition (i.e., "dom0") and I don't have a setup where I can run =
and
test that configuration.

Adding Nuno Das Neves from Microsoft for his thoughts.

Michael

