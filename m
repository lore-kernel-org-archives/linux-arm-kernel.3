Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C4CF53D81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 18:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5SoK65csanFH4vMKQZDS9V9YBzq3hBLvTAjvGQXne/s=; b=4LobSW6DRpSxyO
	paED9eiMK77VTMqA0Zf7ngFNrl/fd+cuz8P1lclXu7ggC+PMsoWblS21CwGNgxi6o11tvwK62TTwO
	gDNdtL6NKqwNNjcmYe3KOyNegQcBGGa9oY35JFF2bqn7nHTxIuEm+/ZABlBxsHEXf2A58+rrfOa9I
	TFy3dMrcUlb+Hc72ifp4UuWBkI3zdqPEK823ba/aeBuWLbSIfxuo82Cfe/tNxmy57y86OU9WRjuxe
	pDmUqQ+AExQBJ9t2i/wuA0rZWjGd0yAxGShxZ0jxrUxgtB4N1XGKnS9leMQLKjlGp8rTvlF1H4bX2
	naJbTHpybOGosizaTwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CgR-00000004gfX-0xHW;
	Mon, 16 Mar 2026 18:28:55 +0000
Received: from mail-northcentralusazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d111::2] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CgO-00000004gem-3ReN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 18:28:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FADRczHs2vfTdvLc0AGnd5Wx8G12nExD6mrOGupaJloWuYqUEYLskuxXP0CRFjsTX0YE6IrpJgUgEc9wYtr7HFKifOymFyi09AKMz5jKOt/8MX9AhKBxtgQ1mW33t2+j+qo8tqhfnt2L3SA9tz7MGPpP118jh7vLjcqUINh1Hq26v1kOHTGmmiO6SCH6ocutumeN0+chk7Zzxsx/NZVhl/aH/HmnxL5IpZaa2IdRieCj6eyoafA1ou0g+nkkD0bGLWcInAKej5o9Ode+2tjHzj4+Z6J+F8tTUmWYBY5W8IZhHio8Ib56BuIirmO690/8Souzrau9F1Yg+ui2S0EOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SoK65csanFH4vMKQZDS9V9YBzq3hBLvTAjvGQXne/s=;
 b=Wv2vMvlUOhLDneBLM81VYMP9tFVjoTOlrRVIiTS+ZUYYEnHo5EWB+bICN+WmCMd3sJZX11jDIfHB8OUM2lcNce8fwf3q/XOspVt0zm034ylrkn0LyR1xUAnMgMLeqUQCjntyLmQ5upzprYxFgihP6Fc+Co9Ep/pANvarz0aZRB/o6ONke3Uz5hQEaUbqeckI7C//gluf0X4zPE6W56Gdp/ADFAQ2vmk4FOcS38U1F7xESSFpwsJigvtIS8Fi/0rswM+OoT91/3jliZsROA1QTFypq+NJrv0HyJIDEW6J0yRTJlzUblmfHlSIPbhjjuTXFJjCmDEXp/QlQv1ebd6E9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SoK65csanFH4vMKQZDS9V9YBzq3hBLvTAjvGQXne/s=;
 b=BKFs+m0gum1SnykvrDiwUMiMswTKoyB9KLrU0UxUu+7FjItdO0WJZlgnBNKPRJsXUfxpMLtvwtC69L9IElEa/i+5kdBzO9w1Uxg3LujHc7aLFvTbXIZuDnAclnLqF2nJBbVxbOBOsk7KEhOgTSiNBeCLFzQS3Zic7PV+g21dSHfwoTyWd6YX7pzIC7fHmv8X0iaJMUjK8ahe1RaTimZO1n2Z7fFF7nTfC+ZzCDbyCDSTbtVTBxL9/Oqn5+aLeeOJ1+ZfN35QYPhdfR4DrVLhryAaYrJ12Sw5FVb2GsXrWGEkfPKvbkJHMD/GN+CtxLAR44sxRab2QfUUs2dWoew9KA==
Received: from EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:25c::11)
 by DM8P220MB0552.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.24; Mon, 16 Mar 2026 18:28:46 +0000
Received: from EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM
 ([fe80::f8c4:7f0c:3f7f:501b]) by EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM
 ([fe80::f8c4:7f0c:3f7f:501b%2]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 18:28:46 +0000
From: Amber Espinal <Amber.leadswap@outlook.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: =?Windows-1252?Q?Business_Leaders_List_=96_National_Restaurant_Associatio?=
 =?Windows-1252?Q?n_-_NRA_Show_2026?=
Thread-Topic: =?Windows-1252?Q?Business_Leaders_List_=96_National_Restaurant_Associatio?=
 =?Windows-1252?Q?n_-_NRA_Show_2026?=
Thread-Index: Ady1cl/D1NkxueRrTYCvrOoyDknzJA==
Importance: high
X-Priority: 1
Date: Mon, 16 Mar 2026 18:28:46 +0000
Message-ID: <EA2P220MB09460F1A49BFDDA9664E190E9240A@EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2P220MB0946:EE_|DM8P220MB0552:EE_
x-ms-office365-filtering-correlation-id: a5fe462c-b515-4b9f-8082-08de8389dc8b
x-microsoft-antispam: BCL:0;ARA:14566002|24071999003|461199028|39105399006|20031999003|37011999003|13091999003|31061999003|19110799012|8062599012|8060799015|15080799012|41001999006|56899033|40105399003|19061999003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?Windows-1252?Q?z7rR8xmysiEj7/g9sD18UKmxjIZbeIJVMn9/XNFW5KWVkJUBRBu1PJ/k?=
 =?Windows-1252?Q?v1togZmosrfWdC3Bvo9oWCbqhM4W0dLjCR8ZTZnhbrmCAf1DtIaarVbU?=
 =?Windows-1252?Q?I8wXPQ1E+hO3JNtA/qP07bEC6jN5/M3E4Dg4DSOiZeQ/IS+TIK0i+CoL?=
 =?Windows-1252?Q?Qu+/nCoTsQiat/yXVMOsZoxLKtW6GWuLTqfSMuraDQTT5TEBQdNSutui?=
 =?Windows-1252?Q?w6OXW1U6Cz1HrPXEO8PBTkixtPbN7MGGLzQgHiFztpsl1Sz/b0QAGx/6?=
 =?Windows-1252?Q?AqN9LPzlIvxBf7HUa2HewICw66qcrbykId1SLhF50KTJKAEXdPNeJU04?=
 =?Windows-1252?Q?bvxh5erDaUriN5pVJDsW9E1lA3hcy3YkrcFEHVqwvjm0Ou5I6aIHLsRw?=
 =?Windows-1252?Q?MF7tSbuUGtdRfOKPll4QASxZHE4XqM+lNmHE3tLW8BN77VRPDPzI38Bb?=
 =?Windows-1252?Q?xuZvqBQ846PvZHxrmbxRybbnESna8so0b7AALDsC3e2cV9qpzbE9m9Wy?=
 =?Windows-1252?Q?riwSTYfVnuJv0gOdRPgSAu1bWQe2XVvWDv2wzl8CeE/DUo9JqtvnQ1qu?=
 =?Windows-1252?Q?aE8FDAU3I4cnN0TzVjt19Appmcw6nvv0m0a6CDWlrzjKMPTmwdZVXyGp?=
 =?Windows-1252?Q?f2lRJlieLzhJDb91qsuVuWrotwWP255KvVNJvco0y3NrN48t6jDlAwig?=
 =?Windows-1252?Q?DQH3LxUXy4XSm1Bh3zSp5s2F2oXKYst9gG048jmiaqTSAtxa+HW3wY8K?=
 =?Windows-1252?Q?DD8SXFAL7E737IiW6SpKCFA+AhKFRy62j4i96K7B6P2ZGm3hDIYRBpfq?=
 =?Windows-1252?Q?TrWluKbC9qDoTiAZx6V9EUnQi3z8FwZ3OAQfkPtw23UwOrqcGTmt49Hj?=
 =?Windows-1252?Q?HTHPTP45CECdIfPVtNeKnb44uAERKlX/+f+ntSE3XCgtn9EXOgO+ShTu?=
 =?Windows-1252?Q?Jti0hLYRiMCgXckKQ/hm7Yy6msJwpEctEomSyQnVkiT8wRcrAKy+zDai?=
 =?Windows-1252?Q?4LYVflE5sDHmsfv/GS6z+/pLw4FtmXciO2vhfxaLDcRed2DKh+J35L1z?=
 =?Windows-1252?Q?pN6V+WwljbWpDrNF8aDKrWBSFwA5BCo3IBWF1Glcn6ukteXYaVsc6OXu?=
 =?Windows-1252?Q?LafpB0zGMQSh+aXrxwhGrJAnQ65Uce9byW40EfzKStqOBZgJJVW0IyWj?=
 =?Windows-1252?Q?5TEwma5M4Rs=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?ItAcZKAc0FASAmNuM8BwcLRLwnq0HmLnxrRFUfy35gHfTIgSeSGg/yt7?=
 =?Windows-1252?Q?WqbMyGmR/p51FOd9WAug5EZTHasdQGfN/caipxgLV5Y9g/ygOUsM4F0x?=
 =?Windows-1252?Q?3vREBYf4vAgE2S8s3RiVfRQyy9Gc4/u1sSXIveMCRtuMm0BBXACy7zZ2?=
 =?Windows-1252?Q?foavvD9ufvagPAt103ZJawe/2K5uvlGxFcx+I/V1RouYoY65AeOVgnof?=
 =?Windows-1252?Q?wSO1cDKbaEG+Xgi/aIJ1cPob4ZzRSmLekBIQQWA2agENMOlYAKswlgLS?=
 =?Windows-1252?Q?2AGriUPBtotiwcoAK4ams35JJ2SDI4wL82vCK2rlu+LxUgsrT9OHEcLF?=
 =?Windows-1252?Q?tsFlDlDnb1t4s/EUL0opRThGIKeZgjXBsspcyV2jM5ZgruPRj5Vc5+Lv?=
 =?Windows-1252?Q?O0GCtYmV5DxXRixAliyQQw4DYWY+oO6nfUkmckFk0ao3dDhhjvThbF6x?=
 =?Windows-1252?Q?zIBCT8EMo3zvPS9+Xggl7aaTE6A6z0ZkirFXh5DIz8784R7HNt2oSyYb?=
 =?Windows-1252?Q?pE2nkX/wuGP2ETSxbh+j+qxXB5PcwvgaS1qun+4NXpA/sSmUTFet5kHJ?=
 =?Windows-1252?Q?rtY/9YjvlR5tXMdwjIp8c5UkjgNNsMXgx16IvGUxOZBzn1WRFCD+bbhC?=
 =?Windows-1252?Q?92ugH46DsaRtL5G/zRI4+PLwPukH3GNg1t5NBs1mTMVz3WKliLUjpA7q?=
 =?Windows-1252?Q?fHXmXVSe/cBb+VH3gSCHWdG2M3IoDr64iVm6TeyNv7OPwzj6ueJJljTf?=
 =?Windows-1252?Q?JDXmhiGw1IQIgwPNqFtBMba+ul+cliia+QbJsRLkZvjr5pLopVAS+79N?=
 =?Windows-1252?Q?ZzUDPoIhiBYdSX/7dVCUFhMR1GkQOt7Fm4BdQXuTC1qKTnkbLT6zFodS?=
 =?Windows-1252?Q?pqKE010DcNcvluMBVPb1vxXcXEu4LKcw/8pFnW2ZpA1eEV4Gh6D1Z+qR?=
 =?Windows-1252?Q?UXOvdEHbpLwM0anxjuhmZzkHGBZMsX1nE4DxGHgX9yinI7jU2Y7h6E8j?=
 =?Windows-1252?Q?F9bOobvmxmZ2jhZQz0YiCsuRAf2UgXOQsb2Cr1pcJBECe1CoFlbkrGFy?=
 =?Windows-1252?Q?P0zJUn3cBPfL1YmwtTIhoG0Det7R+8spKBB3SFQ91x9LBMIq9qVPHsZ/?=
 =?Windows-1252?Q?mcX3YECReJ+9vasgyTpA16EPs4MUffSNLwRubDpZyvpbrHmX91EpnhuX?=
 =?Windows-1252?Q?s6sY1E8JSLBW8ouWn4QjHqdoE7D/+gt9uEFpr5wfe/e+Xe4Q0VU/XwlM?=
 =?Windows-1252?Q?T7sDn/Ngv63DyyIb8UvzPMRucnAQ01BZK1RbQErKbIT8Tv3ETqYDKB7I?=
 =?Windows-1252?Q?VX0C+34RE8o96ZTEzj+fW32EGW357RxnLCur48udSZkhhI/65CJv9lQy?=
 =?Windows-1252?Q?E32IySqMgRTH0ZTppiYAFZCQvuCpWf9elbp4MFp9Yqe9x9aU1/urqycE?=
 =?Windows-1252?Q?BSpKNrMcFAw8qmomzoKE2LAtnvhA0D7IRwL+8CDM06fUyNlbjfVWqzFS?=
 =?Windows-1252?Q?ePlc7S4R?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fe462c-b515-4b9f-8082-08de8389dc8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 18:28:46.6718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8P220MB0552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_112852_889200_C03F17F9 
X-CRM114-Status: UNSURE (   1.83  )
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

Greetings,

We=92ve curated the outreach contacts of buyers from National Restaurant As=
sociation - NRA Show 2026

Event Attendees Are =96 Restaurant and Bar Owners, Management and Executive=
-Level Reps from Top Restaurant, Hospitality, and Food Service Brands, Reta=
il Food Service Professionals, Food Distributors, Equipment Dealers and Oth=
ers

What you get: Contact Name, Title, Company Name, Website, Physical Address,=
 Phone Number, Fax Number, SIC, Industry type, Employees, Direct Emails and=
 Verification results.

Say YES and I=92ll share full attendee counts with verified cost info insta=
ntly.

Thanks
Amber - Trade Show & Events Coordinator

If you do not wish to receive any future mails from us reply us Not Interes=
ted.=

