Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5858D4336B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 03:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wp+vTYCjH2BpXWY0mBvRIcmV+ZSaR++Da+3qfBFMKSA=; b=N+vKVehjDEYNgD2WhE81r0Szls
	nARbhRpAPTsGADDxjWtc/hloC7ES5kzvHnXUJGbDBLLZh0cow7jijsnS4ZTT83N0Hu+bp5aQMTH6a
	PaIMN3XUKRRlkoa9ZCIYd7gvPQMc44HU4VE+S6x0dc2UFIT592qhcXPrEm791Cluo/CqJBoyxp2WP
	rx7qCtafMTtGvgMawvDvIiN6rErRoIabX4ejpeUpN/utoWP/pMbumngxG07xkLOWFWP1qd9h0P+pV
	eVXa+fKg4tCtWKCPCGpWysAchKlz8XgV9TarpdfKnwZ+/IHdIKialdQbTz8YfnxcXX9nuO+pqz3bA
	fMgJvblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtyB-000000001lS-2LFg;
	Fri, 12 Dec 2025 03:37:27 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTty7-000000001jd-2HWA;
	Fri, 12 Dec 2025 03:37:26 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BC3DAlB022803;
	Fri, 12 Dec 2025 03:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wp+vTY
	CjH2BpXWY0mBvRIcmV+ZSaR++Da+3qfBFMKSA=; b=jelNWPiDEORIsc+oAdJiOb
	o9vpR6YQf8a5zsNb+S7U+1LN6TWDH/x32WyxTBNfAnl1Z9nWm5LVLQJ2+e07vvfk
	1Aud37a770LgBDde6RHtaNGFINSllzeyZD20SnqVTZhxUpVFkzLdBiTeHu/9QCmi
	FupUi/zKeEkzuukr8y5PkmHkcbfwLyNwbAiq6eIrGKhvp+kLyBBl8H+A18JI81xi
	klyHVuD692tCsTiJbORCAGQ+7Re08ju+Q2TGVS1IoCZF0ArSxq7JU32oMQXvKHD0
	w8zYC0BW7vA9d3Dae9MwsAjcAz6liBn0NTgnyZodwATXI00cBu3L/5hge4uUea5w
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc61u8he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 03:37:12 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BC0gIQa028126;
	Fri, 12 Dec 2025 03:37:11 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4avy6ya1bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 03:37:11 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BC3bA1B29295108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Dec 2025 03:37:11 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A50CD5805E;
	Fri, 12 Dec 2025 03:37:10 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D58A5805B;
	Fri, 12 Dec 2025 03:37:06 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Dec 2025 03:37:06 +0000 (GMT)
Message-ID: <13664f203137541ce8aba74cac3777099992e856.camel@linux.ibm.com>
Subject: Re: [PATCH v17 00/12] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton
	 <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, x86@kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        alexghiti@rivosinc.com
Date: Fri, 12 Dec 2025 14:37:04 +1100
In-Reply-To: <CA+CK2bDDZi0TR9fhAuKpxz+XJU6-rOS_iM-akU=oTb5wVoVxMQ@mail.gmail.com>
References: <20250909091335.183439-1-ajd@linux.ibm.com>
	 <336c0402c59363956d0c4eefc1b8a059e1fcc8e4.camel@linux.ibm.com>
	 <20250925161726.2b34890070e6d8dcf8ad3ba9@linux-foundation.org>
	 <CA+CK2bDDZi0TR9fhAuKpxz+XJU6-rOS_iM-akU=oTb5wVoVxMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX+kBUVpmMzDE4
 RGj2CUtYWbrx/Of6PGswWBpTVaxGP3nwMJnxqHn9QiDDCAoiQit8W/rhik3ZjF7VM3ZQy69KSK3
 iCpfEiC49mzCq/hExQeWrtPs+FgePUlvAAkKjC9g88OB7j/3sVeUXgdsld/KQsvBbvCmyMYEn/y
 qeMU07abl6hWX4ojS+Mjks/PWvc5rqfiANkPjnyfMnd63LUykxH9T7HdI09JXvNavJML2w7/KTx
 r7m/URDYkfciRWxHUM7Ew5SBhyBEbLPpFpi81h1QgOWAtswLCHNojjMLOetW+oj+lV9FfT0+9Ro
 5eUn+Dm4AbXk57q9B6bqFXxJtBkWN7Lj/yT993PG/odDHdAchrmCWUsV0dFxiaNdJEfzoZGUaeq
 BocxCI++N4A16CPPI0nxK81kOXp51A==
X-Proofpoint-GUID: 0mx0bl7tMI0Ev7mDlA5PrAzvdwe37wsq
X-Proofpoint-ORIG-GUID: 0mx0bl7tMI0Ev7mDlA5PrAzvdwe37wsq
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=693b8de8 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=vpjFdhQh-OGVaG3VjK4A:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_193723_592629_247155E8 
X-CRM114-Status: UNSURE (   9.21  )
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

On Fri, 2025-12-12 at 12:35 +0900, Pasha Tatashin wrote:
>=20
> Andrew Donnelan, looks like the merge window missed again, could you
> please re-send this series so we could get it into 6.20?
>=20

Yes, sorry I have been busy and I am prepping this to send in the next few =
days.


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

