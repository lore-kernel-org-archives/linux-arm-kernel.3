Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FBCC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 03:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lf7BvVIDm8EM4XYNV56QJUeGN0cANCnC7Jw/EtcpFEY=; b=fSOndUoTjvUwv3zI/t4ePu6dYz
	6z4ZXzOB/62NUrtyiyHbKttRItuVhdJr82dDV+HyVIYysXp9bGNaIGh5ivQZLaSiPSqKB70Yb0Tb0
	PF7uKVDrfnYjAQ8eV1pjJgB/NFX98tXV67qQocRZyVyZozw2CZlmjNr1W/CE5a7oPRUXAPESeHMCj
	8R1wYBrOp50B5OvTX+AZ32qd308cPxkpEazQkT/Yy9lXc6cWFR6KEeBR6PWKf2eGRZmfMB2AbOqsf
	f4nqd59T91ipOMnS+uXLcMsk/RTJeTQl13b7zktafb6a5ZqoDGr+v+tju9ai8BrwSdc8IDA6rBoWV
	xYmK3BBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBzV-00000008jJ1-0PUs;
	Wed, 11 Jun 2025 03:19:05 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBxJ-00000008j8i-3FyX;
	Wed, 11 Jun 2025 03:16:51 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B0wOUA005022;
	Wed, 11 Jun 2025 03:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Lf7BvV
	IDm8EM4XYNV56QJUeGN0cANCnC7Jw/EtcpFEY=; b=LPSzMqm316st9ZRmvQohwq
	4MmCCN2w4wfiFJhlO4k5MovQ1dKzRcpmgm/P+yIApgO/iNYvXHfdB0Tj/HilTVME
	FurFKplwHWSRHlkT4BXyv8jMsUdHdUIcURVpUFQZLOgJzoIJjVOUfiRi7h+1HQ1L
	aY40ojvmwYMeOSPjZPCC6Y8www2W8nXltmxw4vKBELl8p45bLuOZw7Zn/TUuSSr5
	d0ZPWuIA403HCN8Gmxr4t5iVEKh2P/VJZlV7jELBQOfH7R0ZrP/4nwrecoAJksrT
	u/y4b3G/NTMt/v5uwfech002AuL3BRYcoZA8u+tAdSYL6jnCv/Dx3b2Y0RcGQd9Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474x4m75yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 03:16:40 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55B0odqo015369;
	Wed, 11 Jun 2025 03:16:18 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4750rp5ph4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 03:16:18 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55B3GH7N17760930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 03:16:17 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E46458056;
	Wed, 11 Jun 2025 03:16:17 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15F665804E;
	Wed, 11 Jun 2025 03:16:13 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.1.82])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Jun 2025 03:16:12 +0000 (GMT)
Message-ID: <491294f7088d9946d00379fd833c0ab20069dea2.camel@linux.ibm.com>
Subject: Re: [PATCH v14 00/11] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me
Date: Wed, 11 Jun 2025 13:16:11 +1000
In-Reply-To: <cd96d70b-1eb3-494a-912a-52d479e3df87@csgroup.eu>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
	 <cd96d70b-1eb3-494a-912a-52d479e3df87@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Y4X4sgeN c=1 sm=1 tr=0 ts=6848f518 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=LR7N31DEqsj-hj7dFvAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: -tWHcyyOJQhD7KXGwD8yxemJpeXmI38q
X-Proofpoint-ORIG-GUID: -tWHcyyOJQhD7KXGwD8yxemJpeXmI38q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyOCBTYWx0ZWRfXz2I+ORnuRokq a1euH+5GS2nvtXIg9KZ82iGM3bExHNmu5ahRlJPOx3jxFV0SITLic2eKrapS4OsG1RiGJQbdUFv AtgTIs5t17enLT6alHjDHLvIYWCvZ+5HRsxB6rH+zQABD7lwtqsp3su7ZnJEJKbUus1WPF52WP9
 WG9K3XaXwpG7i2Ii7XIT1M7bDCkh40mlNuu34I4vE8XW7VAX+brkzSvZyRbNDjSsVnGuWjfnc/S rH7mYWhK0GZRoBM2wFwE3TP8VfqLrdwFMWR4d9dPPgYovR2hioNprdwcMJrLAxnBXqg2QOe4CdR tE4vsV0uSU0QrueVVUE417GAiDJ9kJ6x3MXfrJvD7KVlWw8iNvICnqIXyK5gmbWYI1GUOOpGFDM
 WNY6llks3q2menjJsssWIqBdQa2nGulbcPasMef/2UjR+YWfXAYcROAxmMSKq/ajJGg/AUD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=703 spamscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_201650_130902_F347EE3E 
X-CRM114-Status: UNSURE (   7.88  )
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

On Tue, 2025-06-10 at 09:33 +0200, Christophe Leroy wrote:
> This series requires a rebase after commit 91e40668e70a=20
> ("mm/page_table_check: Batch-check pmds/puds just like ptes")

Will respin!
>=20

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

