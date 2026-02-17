Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C4EE83858
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wps+YWuB/ATh5Lui4/BAtJTg/W0Am0d3K7J1MIwT1s=; b=YSlEhkdf7/Vi7Rb3zX7gHOSmH6
	dT2G7KEfLrNhSlDVmg5siOVic7x8JTWJTpitodYRN15Xgl+SfjfkBuX0e1HamLAqADwugmTQBOlyu
	28+aTcwR6+vGjMHEeRirIqT8YvBIGOF+sIna8R5ajcT+RUrm2xJvWym8UWkMuh8y5Ni+GBAcOeZrX
	GTncvxrpX3Wk4FpeOayNZ4xd1H0MlKnKoM38O/JMB8ErF06Q9Exm6ptdUybE+ZPb7ykUYVJwb2bGc
	Wg6XCbk0KKhk3Y2kBZMHbCAAXdFFHUgDB+ei1YL7Nfz6fFyfSlLDxco2eF7fNCFvjh+O+wyQ3pdzo
	ZXmQNzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsL1P-00000008JCz-3Rau;
	Tue, 17 Feb 2026 13:21:47 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsL1N-00000008JCD-3ABp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:21:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWKpyGPjeYBbvTM+QEoNQTZfA43mUzRiiB0aqPeUx/NaE47vPYsE+n7p+zOIeVsA8X2Pyk4f799+GCM7ZnfiXBS4UOdOX5bLGavlFJNZn1g/IMeY2POxMyHeNeNVtJNUsIlHG4x7fkU+H9xFNeliM9ACWuh7ow0TglAg0rsYMUK/zrwlOHWOOuzYym/AOIHGVgkHMNY2SecfaqdQ6U0sT9MjMatt00dxcbZprDGgnGCEFeGnnp1HaJj2EDLIFcbvlAX5amH1P/u+Br+dGCslA4/N4bUxv6z77qsUTcxCzyuzFcxMGhVb5AnX/kZB5Xs+W71xGbiVnCkz6/YBoLQNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wps+YWuB/ATh5Lui4/BAtJTg/W0Am0d3K7J1MIwT1s=;
 b=LPSiUa/fCYd+eDGMj+IhQsQ4uDXZnuuYAXb2m7vIBdHM+x4lOKZBIE7Lkvdo7oQJJQx+vPDs+4VwozKkMfwh30qaPB4ywolm5DwNFqm2L2J5mjYcUeXf5qBNQpKKFlkgxcT1ODIioG2r3IuUvDd/3x6VIjjGbtNLdZifdo9Tyf+hkUfpjB2yHnbhYRyeNn7zewZI259dne/+W9wDIpMZmUB7JPEkMUzz7qF6xxoUfQlfpv46d6DiREq7wESPS/Kg+4cOQgS27V3+XrQmeVueqz7RBbIVDZTarM+vh7NjOBcjxFUPDVXVqGeU9zaI++E+toanyjgpTKrRlPTWmMkX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wps+YWuB/ATh5Lui4/BAtJTg/W0Am0d3K7J1MIwT1s=;
 b=SkdI9nmLJu7vAJd8Qxk0P1Uc/3ceTfLBep3s8mWM6yzWJQxQTeZE/FNyaw+MtAbPSEnT+4aW9vIOZ3uBcpsmQygRVZfhANoF6lUCELR/v1SxjJBk1Z74Ay2lUr1lv1lrPIZJjP5wiujEHPwpFC2jWr9BE3NUdr7e2hNDhvCvvE1nWugUFCuhmf6EESxQBYDDE7PLIr3rpUJFeShyMHHKm3eyh/JlBpzv5c8FYJNvzllrPBTPesuDfcRLzkYaSiy7qIQXtEAKmi4AdzZUzCl12qs75fKMXJvlPImCKyDxCzoASjPOd/Swg1RQX3PhA51Nl+YHeA2IKr1DoyxGK7RY8Q==
Received: from MW3PR05CA0015.namprd05.prod.outlook.com (2603:10b6:303:2b::20)
 by LV8PR22MB5763.namprd22.prod.outlook.com (2603:10b6:408:267::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 13:21:42 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::ae) by MW3PR05CA0015.outlook.office365.com
 (2603:10b6:303:2b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 13:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:21:41 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A88E1E8F41;
	Tue, 17 Feb 2026 15:21:38 +0200 (EET)
Date: Tue, 17 Feb 2026 15:21:38 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ARM: dts: imx: b850v3: Define GPIO line names
Message-ID: <aZRrYoz7nwdkJxAW@zeus>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-4-ian.ray@gehealthcare.com>
 <600ec825-4402-46a5-85df-1e57f0ade49d@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <600ec825-4402-46a5-85df-1e57f0ade49d@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|LV8PR22MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 11db804f-42cc-4d3a-fa70-08de6e277d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cW1lejZyZC92blQvRUZveXdTQjQ3bU9XZUN0NXRLZmFaemdqS1ZlcU1LZDMv?=
 =?utf-8?B?YWlWL3FNbk5JY2ZRQWU1WWR2NHQ4MnQ4eDhBd3hVckd6ZUZMd3lvc09PVXZK?=
 =?utf-8?B?UXlVTnRhR3ZwYjUvV1Z0cE9vRXplcDB3RDdMMFg0TFNSczAwUE84VDdBUmNX?=
 =?utf-8?B?dmYrOG94VERHWkdtSmo0bWVUUlBRc3Zhb01jZU1ZYTJGWXlSa3BrandBZmZH?=
 =?utf-8?B?emF4UzVmZlpuQU1ESzNrY2ZONy9zQXR6bkVubzR6UXp4VEZ6WWI3MzZoeGF5?=
 =?utf-8?B?SFFVZnRVeEdyOS9WU2NDL3dFSk1NYU1tMGZBTEZXTTg4Y25RSHNTdzUvbkpv?=
 =?utf-8?B?VEg3WWh6bEpBV3ovbW02dzZ2WFVMdEFwS0VhcGZIaUU3L1k2QVpiaCtqbmNC?=
 =?utf-8?B?N3hmdDdVRG5uR3JKaGpsWTB4UzdrL2NucDc5MHB4YkJnV0NoOCtDVDBxTmw3?=
 =?utf-8?B?VXhaRnZKa1FiKythOTY5L3dFUUtlSGxXRmlWMVB0RWZpbUFSeWNZenJ2VSs1?=
 =?utf-8?B?N2EweTVCZUhreVRhQlZsNlBzZ0ZFbU1Pa3pleWYzbVkyVnkvTlVsM1d6a1lx?=
 =?utf-8?B?M1QwT1JQdk9jUmdQZ3NreFdhaFdnU0thcXJpaVptdDR4MUV6d2JuSGNCdU5O?=
 =?utf-8?B?bE02MHN3QkhzNUJLdjVnREtyQjB0QWlDVVdiZHlQZUVpSnBnTGgwTUFPTVJa?=
 =?utf-8?B?SXBuT1VqcHFNNnUwcWw1S0FuVHFaWDlwQ2h6ZS8zZzFDR3JwUEF3Tjd3L3pN?=
 =?utf-8?B?NzJTcnZMZjF6NTl5YU5sclRNYUhVRWF5UTZGenNIeW45UGYxa2lrVENCbUpp?=
 =?utf-8?B?WFNqSmliQlQzVTZKV05CU2YzdFNScmdJd3d0NFgybFlFUzFDZnJobHR1U0hY?=
 =?utf-8?B?YUN1Uk51QmdYcmdRWFJkUHZnendEczJGbkhYRjF6UnBCVDhHNzJmbllnZTB4?=
 =?utf-8?B?ejVYcjE1a1dsMUs1N1VHbHVBbXluc3lwZXRjWlhyUFYwVzF6bmVuUkw5dFly?=
 =?utf-8?B?RTE2akY2c3JpTkRVYnRJZ0YyT1hURDVUVTQwYVhieU56TmU5U0J4VTM2bGow?=
 =?utf-8?B?cFFSNldXNVR1QW9ITXNLV2dmcTJPMlhpalhuUGk4OFpZQXY1MFl6NHFwc0Z3?=
 =?utf-8?B?SThDQktVRG9yc080VEhpZExVTW12ZjNMR1hka0sxbkdmVlFGSWJFZ0k3ZGQv?=
 =?utf-8?B?WDRnZWRESGhwVTJWbXlBc1ZoUGo3RVYyVXp1MnluMU9TU21Vd1BBb1hvMk0r?=
 =?utf-8?B?REFxK3c2MlBLZExYU1JGK1loTmtLWFEzbFVTOXFOR2NWMG5vZWpHbkJJOVRn?=
 =?utf-8?B?WlZyVEs4cWZYTU5DWHBkYkNPaXFlNGtNR2NjUmgrMC90QUh5MWVxRUhzQThp?=
 =?utf-8?B?L2RWTUR1a3JIU0E2bkpEUE83Zkh6dkE3N2hPa3J6OENpOHlLd2dkUnF6cDlj?=
 =?utf-8?B?ZTY4b21ZSWVDZVRzaldqS09va2RVcWFKZzhNS0thVGZ3MDh1SEVsTzY5V0Iw?=
 =?utf-8?B?MDFlVnZzY09nWnYzLzZldHVNS2l2TWtVcVlwVTExUUNYQ0dKTjIvZUlxd3hT?=
 =?utf-8?B?aXFSUDgzdTRWdTZ6MHhGYTZNdHczYk5VVG1sZGE5MGRaVVUxOWFvRUZFRFFt?=
 =?utf-8?B?WWxwd0wrZDhlZXc4amx1MVBJOGtiQ2pFK3pYSTFmVEV1c20xbmIxWVRaVVFR?=
 =?utf-8?B?OUlreXhwYll6SE96Wlkvamt0Y3laSFpLR2ZpMDBDWnpReGkxZXhDdlN5YjNS?=
 =?utf-8?B?dDdmZkVidmJwd2R4QzFPNGxndFFrTC94eE5jME54dXpmU0hwZklOOU1lblNY?=
 =?utf-8?B?UE8vOGRBMXhvYmQwZzI2RThtdzBGOFNGeXIzNklWeGJvN2FNalB0RVViQ2Qx?=
 =?utf-8?B?TUc5VXVyOHZ0ZGxXTldjZWkxS1hWRFhLZXZrNTBCMlBoaS9kQUZtaFJUOGpp?=
 =?utf-8?B?Q1BmS0FZL3VtYXZ5KzkxL0JmS050NUg4Z1hUdTV5VEpyb2xCd1RUYzNGQnNk?=
 =?utf-8?B?dk1uZkFHWEtQR2lCV0xCcTNITVc0empYSURuNE9oLzRVTkNjZkJvTUhqQXFo?=
 =?utf-8?B?T2dWSWFjdFhrOE5zSjBPVitQSzc5eUlLMEdleSs4bEljRnpCNFQvVUVVMk1D?=
 =?utf-8?B?VVBlQk5XZk5rNFZhSEM1MHVibUN4dnNoSjU4RVpzRi8zcHRwbkxtb1JPeVN0?=
 =?utf-8?B?MHBEc1ozOGdnRzVxM01EWG9ZMHJ2dWFGci8rRVJVa0hQTlN0NXZhMnFrWi9K?=
 =?utf-8?B?WlVoVEt0dmhRSG8xeVp4UE44SW9BPT0=?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: phtsT9/5pBtZU98nCSP6fNfBOZWTA7qRcxnmHEILAOAOhhNhY48AhPf+y1pAJRd6zymA+STf+eetCzpwrgrpFSpk/+FfTcOKf5KHVs+LjwRp7Xo+1ZpYCsiW2MUkKdJZeVOTzpTdU4O4dN+i6BttjxkBdqgJbvki1CKmFNShQjSYPah3Eu4Rtc+M43QDR01sCW7h200gCxvIcq36oUnIzCaX1Ab2hSMLQFgr0kRlKzvDgI9TXJotbJl1RYFCtHSJlokNu4ARO0AD3W1vwl5uHBl8UjLKXXQW/aP3QIy4mLcGvvo28Qu1MvIh9ikTKMFL0MJ67C4sKOyqPW89EmnoWWD6HkLlREdtKM+UovUPuDIl6swbkMT1xUkzNKfa/wpAxDqRht/gtG1qg+iuM27IYjPZAoDTfpoYgHAEMHvRTzUfAkWpppPyxB2GBj0lMmYn
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:21:41.7067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11db804f-42cc-4d3a-fa70-08de6e277d5e
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5763
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_052145_795956_0F12F9F1 
X-CRM114-Status: GOOD (  13.59  )
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

On Tue, Feb 17, 2026 at 03:23:02PM +0200, Daniel Baluta wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> On 2/17/26 14:59, Ian Ray wrote:
> > @@ -72,6 +72,18 @@ lvds0_out: endpoint {
> >         };
> >  };
> >
> > +&gpio4 {
> > +       gpio-line-names =
> > +               "", "", "", "",
> > +               "", "", "", "",
> > +               "", "", "", "",
> > +               "", "", "PWGIN", "",
> > +               "", "", "", "",
> > +               "", "", "", "",
> > +               "", "", "", "",
> > +               "", "", "", "";
> > +};
> 
> Looking at my latest version of code this node should be a little bit up in the
> 
> file to preserve the alphabetical sorting of references modification.

Good catch, thanks!  Will include in V2.

> 
> e.g
> 
> +&gpio4 {
> 
> ... then
> 
> comes
> 
> &ldb {
> 
> 
> etc.
> 
> 

