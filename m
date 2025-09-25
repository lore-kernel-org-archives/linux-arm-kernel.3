Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC6BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 22:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nitDcQyKm4NkSdrvGfnoFJK+u+59qy52l/in9/PENFA=; b=tWrmd7PKwaGQ18muzWoUNQwOL7
	DcVJZTKXQ4sWcIxW1zc+Omk/1fsJsUiKIO12w5lnH8k+QfX5OW1HNKuIlzXqSecNOYRh5CcYY009Z
	IXWTFDVCTGwPkQwoHzV+Z/QxptdWmaCjyyMZIQnbxifYqKhwCKsFjBS83PzyzJgACLe3+z5mgR3tI
	PHh+YIGJet1yRQIxUa0QxtqSqM9/sdFcoVE5+zQuYGmF83VCkpxnyX9h6GIbvPCgMaZP028KB5ylh
	Yk/AelH4XamjoY/AxOCqRWF9EJdXiOjjq1E16osLFwM3o/Hv8wfyn61oKbMrPgkMqdqY7L4YNmdKm
	fD3XIeUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ufx-0000000Dgec-1ks0;
	Thu, 25 Sep 2025 22:42:57 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ufu-0000000Dgc2-3cUo;
	Thu, 25 Sep 2025 22:42:56 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIlku0029476;
	Thu, 25 Sep 2025 22:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nitDcQ
	yKm4NkSdrvGfnoFJK+u+59qy52l/in9/PENFA=; b=ObUaTjnVdITMiJdUsAaBva
	XLZ1KtMdmBp5Zgj5HF5l736Dw8UHyUhD3TisJilpRw75rsai+utMNLZI/A40Gk0J
	AIsS/G7spYLQbIO0kZU4MaW2iV/aPWyZoCKgkQVlo8X5W+I2HjCSV311JDj74M+7
	AE+XvFGRJ786VL4MUt+qd0wuYjp+Dm18KSH3XLhU+kGNoHZtITJdR1Vb2tgbx8f/
	XDfyMpdu8TFYY/5/2k68gzz9upb0rFrkfJbB08Avlo1kuaLpzUrF3wP4zuZtecc7
	wmN72T9Dnd4s9T4WOJSMaXD6jTl/524rYuOHseRoTIls1+pmarwlMs/vXc4BxfzA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49dbb3s2av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 22:42:44 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58PLea2s006442;
	Thu, 25 Sep 2025 22:42:43 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49dawph4a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 22:42:43 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58PMggep33227348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Sep 2025 22:42:42 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB06958059;
	Thu, 25 Sep 2025 22:42:42 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5E7158043;
	Thu, 25 Sep 2025 22:42:37 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.14.161])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Sep 2025 22:42:37 +0000 (GMT)
Message-ID: <336c0402c59363956d0c4eefc1b8a059e1fcc8e4.camel@linux.ibm.com>
Subject: Re: [PATCH v17 00/12] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        alexghiti@rivosinc.com
Date: Fri, 26 Sep 2025 08:42:35 +1000
In-Reply-To: <20250909091335.183439-1-ajd@linux.ibm.com>
References: <20250909091335.183439-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3NCBTYWx0ZWRfX5ysG32sTPFXd
 uf1R0BRsI0BKicwSpsBxEsSI2a3nnZJqMzF1o90w6Fz3y2zUhPJ2779DnKRJOVaK9VhKCmsSlHP
 /2MXq9DBNTVGPSPGGD9cbqJyAOkD0q7UeemycTSAdzGpVHSooWMOLLYPjP3KyU20YaYxH+bkEin
 MGJn3OOl4+vJti0slRv6mCHzTZ0n7nQaw9gF4Vg4N0KsY1Vd6Dwr0iLkqNCzKSRcTrk+q8Dol9Q
 qU4YSwx4Ahh4WWCTr1UhV4TK9Af+6BnwFIHzvgf7l8TqmRVWGOLGhqpqa+uiQSq8ueI4HKd5JZh
 VqBopl4TR4l8azCp1YGG5ilHhX/5mUQSAG+mGp/8c7m70OyuL/TydKQdeAYOkVykSxlq+rjcDlP
 DcEqcvCGhSw8iFb5/oSEczTL3v5p3Q==
X-Proofpoint-GUID: dpRrG9bUj2ZLNf81WWW-h6dqNNtNb9Wo
X-Authority-Analysis: v=2.4 cv=T/qBjvKQ c=1 sm=1 tr=0 ts=68d5c564 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=owR7qqmZskU0YpnQVroA:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: dpRrG9bUj2ZLNf81WWW-h6dqNNtNb9Wo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_154254_904829_3ED3E0E5 
X-CRM114-Status: GOOD (  18.91  )
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

Hi Andrew,

On Tue, 2025-09-09 at 19:13 +1000, Andrew Donnellan wrote:
> Support page table check on all PowerPC platforms. This works by serialis=
ing
> assignments, reassignments and clears of page table entries at each level=
 in
> order to ensure that anonymous mappings have at most one writable consume=
r,
> and likewise that file-backed mappings are not simultaneously also anonym=
ous
> mappings.
>=20
> In order to support this infrastructure, a number of helpers or stubs mus=
t be
> defined or updated for all powerpc platforms. Additionally, we separate
> set_pte_at() and set_pte_at_unchecked(), to allow for internal, uninstrum=
ented
> mappings.
>=20
> On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible_pag=
e()
> requires the address. We revert previous changes that removed the address
> parameter from various interfaces, and add it to some other interfaces,
> in order to allow this.
>=20
> Note that on 32 bit systems with CONFIG_KFENCE=3Dy, you need [0] to avoid
> possible failures in init code (this is a code patching/static keys issue=
,
> which was discovered by a user testing this series but isn't a bug in pag=
e
> table check).
>=20
> (This series was initially written by Rohan McLure, who has left IBM and
> is no longer working on powerpc.)

Is this likely to make it in in time for 6.18, or should I respin it post m=
erge
window?

Thanks,
Andrew

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

