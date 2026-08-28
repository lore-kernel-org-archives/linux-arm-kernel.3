Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FDAC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKpJuez1amamacYK8OVY1vdNhzP15qmlK4G1sUzKH1g=; b=iwXJPp9ontzjQVauMUumruhlW3
	jryPROKVTLkKYzGmDQR7g4k6rNrVb2XbNwJSQL6jHc1WeqiAg/FBs4cDu5zp3iusmpBsvyDmT0OI5
	Kmm5SCjbeEF0re8YdsiZs4gJ2X0ySbI/BzDSAGGdR8t3FhWSU/AZiYCrN4/m8/l5g+PtZ086r5wjh
	m/m/rzgdk6BsbuNobpxo2cWz9Ua/0N9E7zJFrbJJPbxadKrxS3KscmvxHMYyvkP70GYIxzrC41Ig4
	lS/KLFYvY7AJ6IspCPq0vDB6LmC0MZfQnk2YySN+powKZZh9O2UWZ1iTqZ6xbM+dmLvI7iPDLRIG3
	zV25fQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuAo-00000005boy-3W9L;
	Fri, 28 Aug 2026 10:51:02 +0000
Received: from mail-australiaeastazon11020072.outbound.protection.outlook.com ([52.101.150.72] helo=SY8PR01CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuAk-00000005bnf-2B9o;
	Fri, 28 Aug 2026 10:51:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ok+Qd//AMFbEAJJ/XdSuGutLOtXHTORlW2kT4kJEATCNk72tnCUp8g+RS6PvjLFTD3jTMlZVzB5qcCnvyHInrOKkNtmBgQbpL5qEm+sx8+3vmWs/5YGNdIOfhVismqrBsi/C1XeyGPFZO3R/rM8nckDNVE5OG/dRh1RjEtEj797lJGGWvE66Rt6a1/8G6QrPTS0KXmNYcWVJTOhMVNj4tJ69+vEG8FsKfK2Fip1gZA/QUML2KWcYe4qPA0EDl+GKYNhqabPHcq0UAcdRQYbYsN81tBICrQevBE0VvBSKlFeanS+RhXsn85PatcBFQD2/+yZPVmhzXyoRhpCMkw4MyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj3i/f++guyvvv37GtQcyxTfuNpt6xoSHOVY9ZaZeSs=;
 b=xCohbBK4+t1UtyUfvjaLTGG59xTX90vK2/vHFGIiC6psDFct5x4YzW6c+Xwiq3VYWiPguk4gTFJJqUqoEyBRAtq8naZWkK2EwfV8ZZAD301zccOwDnCe3mYe1eGd9kcqjt7lhLELJ5HGy49cbrrRgLyJ1Nb4WMkpsTZ6OB/FwGTwlfV+WB+xdF2PZKAJgUDEEo0rcL37AroGKXKSCtxkouI99A6DOaavJzKWVCmTg3LHgxXqyu51rF1FHZ/E6ghiPNrJLX/7GkTGL5qUyHKKdN6BvGQgfspBOA8/fH4aqOy/5YZt/SyZa+20yXtzK/3xvIWEQo5PswGgR9l5JPtxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj3i/f++guyvvv37GtQcyxTfuNpt6xoSHOVY9ZaZeSs=;
 b=H6ZSttm887XtGh7cYC8RF5+7ozAXn1NdtBOcol31QOXIVdwD/sqkB28jgKwZy0+s36nI84q+G0cujE9Pk4JH3uYjk5JOjcynPd5BRXff9Lu4hdf4d+d5/Prgb38ZGL3qYPXfUkVNfw3HiuyDhLMfazJ9OGMB+so+0YmsHn+34cnFgCp9sOOs+8yqY4Roq1bHPYgAx+Z5ibMD7YtDZIx6HNvs6R/qZ94rZ+7vWwMZfWiBpsArCxwkKRLsrgIQSk6HmbLa6TNbQYyIImupxRRF+byMuT1c7H/Sciu8No9vKtWZIZEpSWZ5V5E26hWpsgBFr3Gl1qaNQLS4kxCOKKg8gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by ME4P282MB0758.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:94::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 10:50:37 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 10:50:36 +0000
Date: Fri, 28 Aug 2026 10:50:17 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3399pro-vmarc-som: add i2c2 scl
 timing
Message-ID: <apFn6U6Vq0nwaAMo@5be1eda4e59e>
References: <aou1Q5-hdF7kRVpe@0d3a7a881997>
 <6298523.lOV4Wx5bFT@phil>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6298523.lOV4Wx5bFT@phil>
X-ClientProxiedBy: MEWP282CA0130.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d1::15) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|ME4P282MB0758:EE_
X-MS-Office365-Filtering-Correlation-Id: 831cc8b1-4ad0-4347-eb29-08df04f230d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2ZH+ScBjouBk8OWMlmGLbk95FdGSbgsYguatI48tc7sCujo1ueXrIRUAzuKMI5K8yllZvodFPNMehnHhIxcEtIQdHPWZaug+zjzyAya6dVA40lLmL6V5LtubPbYE4HWchOaDq7Em83XHUWhthBX+VufbdEOh9xYCKCenROkBdp2Jq/d5SsNqEn0ewaBT786t+Z4X+sqLUmgymsVyPEmhbunsPQPP6Xt/4bJsaUOfOJZvdM4b4ioG1VD05DTL4JNBUF+6pJ5JvuyqfNBYBJy4itanauguOjh4RHohuyHZKE4RQv1tYC+j60a6rdmXsRrmsdgaJHhs/DQ2lcAbMgwHPLdQjWNtbfjB5Xz/i1es9XznBVnoP7VT91Zi0Nqzu8oepqMXC2Ix9kNr0QuLuP6lBNl3tFrZvJ/0DdS+Ku5hV6b+2xq9hqdYK/YYqkVLo4AeMGpcSqh2onxww+TET440Ko6Yi/VmiTo7W2WYOMC7q3svEspsLKylehbA5FFRi9Vy3Gpo3b+lmCm1DF3640QiNVkmBv07F/a/iUXwohu9mvbHIWDWqOexnEsEscZeWHlsLayKqwmKSO6cvNY0a1N8Xhfpg31L02BrO6bchU6y4zPEqxQR207qj2yofvV+zmAVuY4GY8d6XlmB+c0Fm5+I0v2rjW8Mkoc8FfXQP4VfcGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zLWesyqckoiNZ9UEHHpUP6JErI9fHvRarq6JNgh8Zo5RSpJt8zw4DjOmex?=
 =?iso-8859-1?Q?oMcXbKP932d53kdS88Scebkb4uHQSYNil7shoZ3YHi/I3uNj546jmve5zV?=
 =?iso-8859-1?Q?kRkpVgmGE4CieDAVNyw+/nJ74B1GdtEEynVxZ/nzVNOCrhoJPAINWHAkmD?=
 =?iso-8859-1?Q?sKsvGH3mdF/ftC4ywijakf9kHfCFt4pAjl9k8oGmSWKv1OGEV9ZIibExRr?=
 =?iso-8859-1?Q?nHyeErzpO8IUpMeRBzsOBYrT8SdtYriJflv+VJfBp6KbBuFLqZEGpERp34?=
 =?iso-8859-1?Q?HCxnwrfP0+iFfeUkUqvdKJDvORnAsItj4T7BBhvN/LsTBXIU0jRrJqI9Lx?=
 =?iso-8859-1?Q?YcKXXqdb+X5Z2DqvHScM9SkJmXSEc7QS05C/NZbP4DRhHfgMCyjFGxARZG?=
 =?iso-8859-1?Q?/dO2mZuaaZa5naKS1AaCKkwbv7xrb52jIZfnODyQY3dZszgS7bKBBRyR+4?=
 =?iso-8859-1?Q?weng7nEq7267VbS4eJUQZpZuL6wIBK4kWQHVV/cWX5CET9O4ySl6O9mGA5?=
 =?iso-8859-1?Q?xfCkm9LQa80gseE5U1DqZpx9gE0ngp4ebhf6dUsL4h6lBekOhGhh2t4+UL?=
 =?iso-8859-1?Q?f785CC2F5gVJJDrXLOm/niGEkaus/8eqqi94KFeeFkr06tO14UIwCXo47M?=
 =?iso-8859-1?Q?p3c78RMer8fpQyiuJOe7yY/I+LWyLzepcwPZfIs3VWJUhYtytXErBEI5aa?=
 =?iso-8859-1?Q?zQKJG+OVTyTdLcc0kcwBaSiVJ6ow8u4LARDqVV6y/wKfIBNA//dHYK7kf/?=
 =?iso-8859-1?Q?vU8kMcZ0o76LtEHf7Te/IHZv4jFK2PCsiwXW4wPBOAd3IKpK3eX8lE5Aep?=
 =?iso-8859-1?Q?wydzBynzKcBHgcbpRD6Y1WSAyPGA0nUV7hzNee+Xo6ws6ULhXLPwgyo3Df?=
 =?iso-8859-1?Q?edbL2NtvmKMFZUUTeXomUrX1qOkTcGgiLZWpCVskdZ8tzgNeMEYY0jnbO6?=
 =?iso-8859-1?Q?rMRajosPv+s6zRaIPrKf2m+hL9fUdHNCA3dk85MhNcxfN90f9RO0DS8ed6?=
 =?iso-8859-1?Q?pNeakfFTmL938n1ByVV6oS75XRlUB8r3lBuQOTiCRNzaZDUpPJatu4RVRo?=
 =?iso-8859-1?Q?x3Im+mPYKph7vxAJn0qpw87mZDeSvOMbolHsMlT31sRgoNdDPiHhDcjljv?=
 =?iso-8859-1?Q?ihTWdjKgZ/Cgm/Jll/BCHoyzley0x5JJp+WgYSHwz+442MX3fdqIVBv+4m?=
 =?iso-8859-1?Q?FIf/0p2zlAK/nKJytfW/UD4f5mq5RiGJiZ3/PT7mbZSbes414eCgh/ZJf0?=
 =?iso-8859-1?Q?cTaIz8VwHE+TEty/rEPrBkrFS06hBGXDnU0FXLTV/EcVGjLPbUzk9T9Io5?=
 =?iso-8859-1?Q?7pV99lSUhsfwTo21Rlf/bM8n9ENX9Zu1VWqcYeyHH/GSzoVuWAfcQJJ/i7?=
 =?iso-8859-1?Q?OF/w0d3eS8tX6gyxt2xTUepYa2a1DjcCqdsnzQveY9krObF+Rwub2YBjDY?=
 =?iso-8859-1?Q?byDB2qr3Z4PKjgIxnXyxdpjo4NhHijvnhMd3APqTgMkmDacrCmsDuzf12G?=
 =?iso-8859-1?Q?2uhJnKmKRLW59Af6ggkuMzJuZ0lfpjoWPhPM5O6V2zfifGT0GRV8kpr6Xp?=
 =?iso-8859-1?Q?6WyGtsfGefoUAL1Idg8yTOIryAyOlxv7Z2Q4dk3Z6OENKJLRrKli5+/A2L?=
 =?iso-8859-1?Q?8ptM9S5q9I6//l6VzK9TCl5l5zUxPW+WHtnwt2mKo8WHOWCqoD20RAcfir?=
 =?iso-8859-1?Q?6Y1jP/6KSjT1b40NbLjluRakbJSbOXr5t5fcM3jAhGTTS7zjL1VYQyIf0n?=
 =?iso-8859-1?Q?74ffq5wrr90MrhUovxCFxNrSao2Dp4n1aaRoq/XOhNt1mc?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831cc8b1-4ad0-4347-eb29-08df04f230d6
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:50:35.9230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ts1XtMnXWNCuZd707PjBdH4BdvywoJSqoxCBU0OnrkOzV6LaQSll4OqjlNBpuFfJQ9kIXovmbTjUwBHvQ/H/2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB0758
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_035100_330775_6AD70233 
X-CRM114-Status: GOOD (  25.05  )
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

On Thu, Aug 27, 2026 at 03:18:01PM +0200, Heiko Stuebner wrote:
> Hi Rudi,
> 
> Am Montag, 24. August 2026, 05:06:43 Mitteleuropäische Sommerzeit schrieb Rudi Heitbaum:
> > The hym8563 on i2c2 does not ack:
> > 
> >   rtc-hym8563 2-0051: could not init device, -6
> > 
> > It is also the ext_clock for sdio-pwrseq, so wifi does not come up
> > either.
> > 
> > i2c2 runs at 400 kHz with no scl edge times. The core defaults both to
> > 300 ns and rk3x-i2c calculates a 900 ns high period, which is short for
> > this bus - it acks at 100 kHz. Set the edges to the values i2c3 already
> > uses, giving 1050 ns at 400 kHz.
> > 
> > Tested on a Radxa ROCK Pi N10: rtc0 registers and keeps time across a
> > reboot, and wifi activates.
> 
> You tested on a Radxa Rock PI N10, but are changing the vmarc-som?
> I'm not really understanding this.

Hi Heiko,

Thanks for looking at this. The rk3399pro-vmarc-som and the dalang-carrier
are sold by Radxa as a Rock-Pi-N10. Radxa sold the Rock-Pi-N8 with the
Dalang carrier but with a RK3288 som (I have taken this into account when
making the changes to the dts files).

I had previously looked at completing the bringup done for this SBC,
but on revisiting the bringup now have been able to complete the bring
up of all IO on this board, but have considered that the dts needs to
be broken across all of the 3 .dts files.

The fix 4 patches that I have submitted so far are the dependencies for
the dts to work.
- arm64: dts: rockchip: rk3399pro-vmarc-som: add i2c2 scl timing
- usb: onboard_dev: add the Rockchip rk1808
- Bluetooth: btsdio: Do not bind to non-removable BCM4359
- dt-bindings: regulator: fan53555: add tcs,tcs4526

The followup commits are to the dts files:
- arch/arm/boot/dts/rockchip/rockchip-radxa-dalang-carrier.dtsi
- arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
- arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dts

https://github.com/heitbaum/linux/compare/1b78070aaef63512688aebfbc82365ef9d6660f1...58aad007a1866bfbab8393f779687ff1ec005209

Thanks
Rudi
 
> Heiko
> 
> > 
> > Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > index 64e6ba345739..074f09c6d11c 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > @@ -296,6 +296,8 @@ &i2c1 {
> >  
> >  &i2c2 {
> >  	clock-frequency = <400000>;
> > +	i2c-scl-falling-time-ns = <15>;
> > +	i2c-scl-rising-time-ns = <450>;
> >  	status = "okay";
> >  
> >  	hym8563: rtc@51 {
> > 
> 
> 
> 
> 

