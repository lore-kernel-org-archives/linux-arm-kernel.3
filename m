Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAFCC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 23:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6WP0V0fQJGdhyfUMNqOTpvbS27WzYndIUFVUJH5QuE=; b=akldpzI5Pbz0EdChIPfm2+jOyP
	NwT4lmvJyGOFwkWM1cKix9vUCqYz5WI+Lbp1uYAFuxF/evSWwoIiz/OTl0KC0+q9oLfPOZtzgJQvE
	qSb1EQxUMooptCgWX93wyYu1EKJcjUSdZOJdgsanBk5/2oPt0u7BHNvrjIE0bQUj6IB7ByUfSgJQo
	wkl+j89buSY0FB1vzTgDKkA1D2MVasfgYs3GTLNuwk0qHgrvAVe+hwjnTP5gNQhDeLz9kAwcaTaXC
	H+FiAaYqgE/akXXnO74xmX2/yoZTOt6iiiWxeBQTEb+7fxsfluaMFGIE2JCeOlLz0HST72JEXJ2Jq
	gEryeUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfS1B-00000001nEq-0nTG;
	Tue, 04 Feb 2025 23:07:45 +0000
Received: from mail-bn7nam10on20600.outbound.protection.outlook.com ([2a01:111:f403:2009::600] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfRjj-00000001jF4-2VFj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 22:49:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXOiQlhJVE8iJBa4x7CknlX/wHsPUUbE3CdZiAMfrfUTjoekirAWRRf5P1gxhkPvig6Z/g37rFBxD6qd6ywWc7lDKwP4Xl7SAHAzjJE93vercAJHmNovSGCOB/M7w13ZwalUx0XxsgVkXE5NLEHtz0vu/t/iBNjf/tTgo6vppPoLLzEgsLCPj+nV3RvqZrbqPWwUzmAjkABcVghN26ze606fUYQKBRYewPo3azw5whP9lriLPAFaEiVobkLYIBCtyrNSJbt/P31zCMCf6QoED8K86WtdQmLZSyglfwnaDAcoF3XZoUfijddU63pIJkx/uZzgjQIJW//7XdVtvuSzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6WP0V0fQJGdhyfUMNqOTpvbS27WzYndIUFVUJH5QuE=;
 b=ozTwsi29PwuBntF3TSl2d8tkcB5NvfNKpN2S31ExLl4bIhd/0mDDjkisN+a3HDq4plMz3k7ToCKzmWhQiA9aLrvD+fJlHOSMn/umsPAePx9u919qtgM8oFcYRNxDzIh5AfWxUxgeGr78LF0pnc6t7Byl6zJr65Lhj3NtnjAL6MSqg8HNP4xj3urXgv4K2Rmr9s2vqMbzhcMstBrniB/Q5WRcMUDs/VUIcFS0zPGwF6XsBRI+iAMX4/iDodZZ5iPqdRZT1V1HfNppI0HgQgrftlsocdxFaDvL338uRtMrhbutvbSQ6JHwhulX8mCBQIq0vzbP6KIWMnKGSZkGBQjBEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6WP0V0fQJGdhyfUMNqOTpvbS27WzYndIUFVUJH5QuE=;
 b=gXTmgui7TS5V+4eac5reT/8yloL4oplajehNqKzIXySOm+ZU5oyVpMqwCZdLRgqPv4lzp8syeuPgWhMOy1S2wc3RHZYrmO7nG5B5x+aG9tQcnyQeP597FIPuOg30b/Ch0pTshrRAStHYavkoLwEMcUIOA//54gE53DAj8dkxe9CvVDVW2ObQpnXHGrd7QryR/ympY8Kayfmz6iaPm5YfTc3iDc+uCDIq2AC3tpQnXNpQ0Cx0cuHKi2FxXS31VYth88Q8XFm6Q7PLdweBh1aKyNeuWK87fVz98MKonPGZcwlln0Ew93L4+VX34zD4PZ6NYWq6HchUwq61Hrr15ifGXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 22:49:37 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 22:49:37 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	Alison Schofield <alison.schofield@intel.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev
Subject: [PATCH v7 13/20] mm/memory: Add vmf_insert_page_mkwrite()
Date: Wed,  5 Feb 2025 09:48:10 +1100
Message-ID: <e98b7e6bed4c1c63feac7b907439168388ecc9fd.1738709036.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0117.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::18) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: a9260066-97fb-47d9-0963-08dd456e339b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XlVWqFmpFetrneddj7Hj6L1kWwj0LF/ZBgxsGSHc9+z0XUwTs25reLvf30x3?=
 =?us-ascii?Q?TPTtturg5Fky04366+KVy9gFxmyo7gxpuSE725L+vAmdYv7oV6/WKM4o99a0?=
 =?us-ascii?Q?xIao7dpGPj+pc9VlvDMbT1pUZxUyc8tzaSd3HlqELTYUibHtGXwbLsLqhCkn?=
 =?us-ascii?Q?81AArF1LEUp2Ecy9V2brK/ieDoQZ1ziepusKiQFx0ver9Wc3qlnqM5afKr8u?=
 =?us-ascii?Q?wJyy1cwb6A5p8m0dMvL9h68wc9TAuYAv2CMVYBIoTxQsfGcmUv8uYcB1zsr/?=
 =?us-ascii?Q?ulFVFL7ir4tvIgaNCNQc80f8hCcTqYq/4d4avG0syDta1V/1n6/PP5L/o91j?=
 =?us-ascii?Q?rUmBCsiewF3cy/vkkosaGj8v0OCUMrTtu8VYWhdPA5sHOtTAEl577ouP+wtZ?=
 =?us-ascii?Q?Pg07vHIQsCINoFX1vFJsdtASVbd5MY1/VwAhvUgn0cpFRAuIiKFQYYZM1ioz?=
 =?us-ascii?Q?RrnsjTW6XZbZCSaqpxJmbnYpXHAk+sCHougf0UT8UVhPqs/edlUV4eDv7byv?=
 =?us-ascii?Q?dFRtSakQSiNMT8hS6WUrWoUfJS7IFqCCl0r3m47Nn6pv90hWzEGwczvv9TCF?=
 =?us-ascii?Q?gWb77R0m49+l2ZGoySzmxLsN9yWJtdUESkvx8kZQivsD6DvWhDz8wvXTIDll?=
 =?us-ascii?Q?AmJl9n8nVm5YcE+x1lszxZ/k7fll1HtmfBv2q/37njWXP3xrg9BFt1EoZtDD?=
 =?us-ascii?Q?qxm19vNqC+ypLXS6kMWDlsPCA6AWEVv32RT6TeX/npjW2ouFVwttYONbtO78?=
 =?us-ascii?Q?R+FqIXK8XQU1Rik/p4pixp/mrlGinmyA1A92nZTm2otpDaJSfHpTzVhHz12s?=
 =?us-ascii?Q?xhiJ4xd6TOYNGChi+xkywrzV8izTxjeXNeyQ4ldqwLY3TztJkxWREq+18FMj?=
 =?us-ascii?Q?798gQKs4iOBVP8fMdLPjLT6DwdXbhr5RiE3Ot2DqQbIknegdx4tOGXw97tKI?=
 =?us-ascii?Q?vkIFkCtH6dFe75n5v5LQD6X44THPM1YoOJmh2e4TWs97jHfU7CEno4MeCYKq?=
 =?us-ascii?Q?Qrgikn8BiVxX4ekSZFc5w5pUD/mZFMU6uDM97xPE+h4DK+j4sFU9fIF8ezxR?=
 =?us-ascii?Q?d7SrGfrz4BHgzODJ0sekOnhZrrKevJ3LTAtXudmwza3EMS1Ygn6Li8ePZxhi?=
 =?us-ascii?Q?UBcsxwIB5zStcTZVafelMiyP6/qx6nOdl5PZZjvWUG7e7aGMA4pgMJFI40kb?=
 =?us-ascii?Q?yUJiuTAONeSEvJteTm21+20rWaXX8aVT0yKnlKdvXCV+x8CA9UBgLGvGqHqm?=
 =?us-ascii?Q?n9/fV0CbM76LAGp7cf4QruJ3pUs6SyRlI+mgIRo82jSe7RGwOCy3xnUEIPCX?=
 =?us-ascii?Q?JGnjceCvKMFAlNK98rll/8JDt9AOrbB8zvWUztLnYhu5nBuqMxJEg2tiGqmY?=
 =?us-ascii?Q?A+RZW46Yh6fWxu7YHxmhhpmVvyel?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GxTkNFKjniDzrFM/6jGqpaPzSGAfEHU2u8mGkxqtuog/YaqakTO5lncdR621?=
 =?us-ascii?Q?Ui+zsz6hVPdFBdvoV+vUbOqiEbKssyvRnXIvDpdIwbZtAn2AuXzV2R//libC?=
 =?us-ascii?Q?bFV935LfLES2i8AfoHLI+8qwAkqP+9WImP0+o+TzPbEQ+T+5Yo8S7wjaziiX?=
 =?us-ascii?Q?ODLqn9gbQrnd/GMlFKcAt46Mw8oahW4icw5AHHofY+2sWmLZe9AmvTO+Sbcx?=
 =?us-ascii?Q?4MAEX5gQw2hL2xNXkjUuZ2uPwWX2nPjWF+FxQmDkg5D+qB3WJvxT7vV7vHbC?=
 =?us-ascii?Q?7WWNw6jccJND9bEUg9VFmkVZ1oZwLEy7cHhnMaZrKkS2H21gooLo8llGC5IJ?=
 =?us-ascii?Q?rr8fvSNQidkErQExPO23Fk3aIxn3h6XYG/+zm0cs/BgaT7qzBuZpwo2pnDEM?=
 =?us-ascii?Q?o/IlXUOttS1BqMTihHD9BXP9HI+wDuAzCCaRYNRGmL0AfscLYiU6qW8CfX97?=
 =?us-ascii?Q?EElIMbPvaGlDcUhl2j8ljBCvOPci0uFdgo4Ktzk2aEFDfUwZIz4nu0kp5pny?=
 =?us-ascii?Q?TVxjRd2+4/Cs8lJrTXuYNXRLWO4ZN47ZYNhkkBQ4W7/VXH/C8+FEvVBHd6SQ?=
 =?us-ascii?Q?s+aLAV+I+5ThSwJ5ja6TZGWByQL6RLAJtkhxZBBy1cSk00KMAYGQWDNfgctX?=
 =?us-ascii?Q?upPs3sgW7ChrFgsKQ0Yo97RAY6uyTu+DwIF2cD4MzMyJ09McvWsOvV6E4Y7G?=
 =?us-ascii?Q?cVY4X7o9Uf/hlKz4Fgy8B/N/J5hY+qdc3a3HIIznDXvLV60GqwuXDQ7rII8k?=
 =?us-ascii?Q?FOo1GLRsdjPs131E2d7wH8K8/YqaKVzGzTFRN8Ep4I7rSTlIFl2dmJAkT3iF?=
 =?us-ascii?Q?maHlX/ARRxx9H4E+8CN/VHGDV5icIwpxHmcP3Vr048x9+SXzPSetB/NkFWMk?=
 =?us-ascii?Q?JyJl14rDGzXCUu8AGOYU0kr6QUIFRa3A6NTW3UIWi9MM263bwLmg33jab7nW?=
 =?us-ascii?Q?5bkD2icLfJnrSFhMPKrRp0zgUSTpPJMQiiyVMG6oInkLY2yBbVDs2b5JbgMW?=
 =?us-ascii?Q?nKeKGndZN5sqIlpMu4oWx/p3+8Ylq4hSXZZcadX9P6t3zERJJAlnG8DZ+Hwh?=
 =?us-ascii?Q?6onnoj2jhUryR4MnB6X/Eep6CavqsS7N2n6eLsg+HUtd/oEzIOxLS3Ec2CZP?=
 =?us-ascii?Q?W+rt5ZOcBQg2r+7Sb2vjI02vpF9CwRUcLAe61HRjYW2cLIklD0+bVL1K1pEr?=
 =?us-ascii?Q?GN26jjFiFccENA0Gos5+uGnYdkq2S4xZhcmIL10OJSwszkgS0NQQsI+SWjmy?=
 =?us-ascii?Q?cNLyXXLaZ2zBJlKfcgq3LuUuwFxFSWZMs2+0jHo3Io6G38/h8BPW/9aC5fiz?=
 =?us-ascii?Q?bxI4LM6XFim6IK8/eCk9l9aHaCk9BkjnuSy+r87DyyMi450mDk18vh8L6oBs?=
 =?us-ascii?Q?c+bb2KfQHoFb/kyDvCrgEhkP+sQ/JMxm34j5fONYZ3oeHIB2sIFARThBAsmB?=
 =?us-ascii?Q?VW18SzkVQegSLg8JGCh6HeRXiKYXli7MH20beyWYtUXJc5VOPdSmlb8Y3Vgu?=
 =?us-ascii?Q?zep/t5YEuaOw+ZGKeUhCy84z4KbT7PwjFnS0N3HUg4PQUx888eXDfrXvwWqA?=
 =?us-ascii?Q?Vu9iw0tg1Zb7dL63sPq5EJGX/1AY+hSbBqgGNtVa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9260066-97fb-47d9-0963-08dd456e339b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 22:49:37.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5DXHCVub0jaqxk38j+Xo/3i7tM7evtV0ASYEHdn7qKjYjWu383PPbPoPCcfC6uT0KDslZpi/GAdcqoPFg0A9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_144943_636626_A5EA950D 
X-CRM114-Status: GOOD (  13.19  )
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

Currently to map a DAX page the DAX driver calls vmf_insert_pfn. This
creates a special devmap PTE entry for the pfn but does not take a
reference on the underlying struct page for the mapping. This is
because DAX page refcounts are treated specially, as indicated by the
presence of a devmap entry.

To allow DAX page refcounts to be managed the same as normal page
refcounts introduce vmf_insert_page_mkwrite(). This will take a
reference on the underlying page much the same as vmf_insert_page,
except it also permits upgrading an existing mapping to be writable if
requested/possible.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v7:
 - Fix vmf_insert_page_mkwrite by removing pfn gunk as suggested by
   David.

Updates from v2:

 - Rename function to make not DAX specific

 - Split the insert_page_into_pte_locked() change into a separate
   patch.

Updates from v1:

 - Re-arrange code in insert_page_into_pte_locked() based on comments
   from Jan Kara.

 - Call mkdrity/mkyoung for the mkwrite case, also suggested by Jan.
---
 include/linux/mm.h |  2 ++
 mm/memory.c        | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068d..6567ece 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3544,6 +3544,8 @@ int vm_map_pages(struct vm_area_struct *vma, struct page **pages,
 				unsigned long num);
 int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
 				unsigned long num);
+vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
+			bool write);
 vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn);
 vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
diff --git a/mm/memory.c b/mm/memory.c
index 41befd9..b88b488 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2622,6 +2622,27 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 	return VM_FAULT_NOPAGE;
 }
 
+vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
+			bool write)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	pgprot_t pgprot = vma->vm_page_prot;
+	unsigned long addr = vmf->address;
+	int err;
+
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	err = insert_page(vma, addr, page, pgprot, write);
+	if (err == -ENOMEM)
+		return VM_FAULT_OOM;
+	if (err < 0 && err != -EBUSY)
+		return VM_FAULT_SIGBUS;
+
+	return VM_FAULT_NOPAGE;
+}
+EXPORT_SYMBOL_GPL(vmf_insert_page_mkwrite);
+
 vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
 		pfn_t pfn)
 {
-- 
git-series 0.9.1

