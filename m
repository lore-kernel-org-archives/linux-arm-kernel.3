Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEEACAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gpbsl99AcwvMMY8pjAz45RrL3lV0my41naP5Lagcwqg=; b=m+jv6TF8/9xDMb+uVfvgRjD68d
	TQuLsyh38GcuxGBUK0g5RMm6Ejub9Ovqt0gDbSKeacBqz3baPtm0tGgMH9tt4V9RSRdyC7ycKu8zT
	q5ux3lNpXTNE9aIPyWDJ8UAWk3dGFOGa872HcMqCoPDRIz8DGlNJXKKbq+SPrUuOKsQuSYrLkdePP
	lzVRPfuJaNJo2SqSAsCceNc6vgdAJ+qy/KaS/LoWK1VdvFFoFCihLDvbTKXLsjNVy+RurDLcBTTr5
	0cACW2mkVquasSe8qEUhsP3nuK2wp4zMlPRH213U3j5rUVmgQiRyI8qIotslwk0LIpi0pLM5AJSJ1
	pQHfn0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytr9-0000000Cc3X-0x5k;
	Wed, 17 Sep 2025 15:14:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytr7-0000000Cc0e-00iG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 15:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Gpbsl99AcwvMMY8pjAz45RrL3lV0my41naP5Lagcwqg=; b=Cdy7Ul5+kZCcoST5wHtOm3JUSw
	l8NTxutSLjuJ+gW2pGC57nKSYR/jH+jgu3P4M3RbiqRVjibects53hEE6Lhesn3WJhGGCds0EeH3v
	uWnFntBO13ca7tXhVpUd8t0qxk8zcAhy5YCOjDJ9jmzEWzwjvI8maTn3ToBdhU0uZZeUxvdcVj6/9
	HNuzJDvtCbQuHBlOf27nFnJrBpyS370P42EM8WvQTUAP3ThhadLlKdRggL0BXhxmKcoBoZnIfsIft
	p+ZQ5+shgWS5QK09nlx2uvm8IejBIahFex1Em73mPfPG2HSUv97Y6d70Xlov7BRKLDBAkz/zTzbt3
	W49+GmTA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytr2-00000007Pqh-0VEC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:13:58 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HB2heh031364;
	Wed, 17 Sep 2025 15:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Gpbsl9
	9AcwvMMY8pjAz45RrL3lV0my41naP5Lagcwqg=; b=kdxUpA6nW5Tmi7rGB3AJGR
	NM/xNi5WIURhafGfjEHgdYGB/psocIFarKbLZ7LR+Xi/jETeHKEloI5I2HX/qqfU
	Bw/WhoOHsJKnFaPkecwpriLEG/ZyJitxlMMNELYp7qCZLx5Npqe/zn8hm3XPgwhC
	l+PBZEdcPvlprtcxn3x5dt84pRqYpc7U3cfTn3dW2pzL+3/lWD/I6q7U46UHtbji
	IqD0yPQyJs7nSLrExCmTcnhUGCyGTEK2EOM1a2I6/Ufxa+rqU7cP2qp3dmd79kFq
	WX+YEdoojkGTAJa3RoNX4kIiWGtUajT7XIe8Y9oTHLdeXx/vRgxo1jzZ2CbTPo6Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4hmj47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 15:13:07 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58HEej22030065;
	Wed, 17 Sep 2025 15:13:06 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4hmj43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 15:13:06 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58HDRm4L029498;
	Wed, 17 Sep 2025 15:13:04 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb122kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 15:13:04 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58HFD1rn61604222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Sep 2025 15:13:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A51020043;
	Wed, 17 Sep 2025 15:13:01 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFF1620040;
	Wed, 17 Sep 2025 15:13:00 +0000 (GMT)
Received: from osiris (unknown [9.152.212.133])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 17 Sep 2025 15:13:00 +0000 (GMT)
Date: Wed, 17 Sep 2025 17:12:59 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Nick Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>,
        Stephen Boyd <sboyd@kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Shuah Khan <shuah@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Russell King <linux@armlinux.org.uk>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>,
        Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 20/36] s390/time: Set up vDSO datapage later
Message-ID: <20250917151259.29680Ba8-hca@linux.ibm.com>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
 <20250917-vdso-sparc64-generic-2-v3-20-3679b1bc8ee8@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-20-3679b1bc8ee8@linutronix.de>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -lB8-8Z2vm3Dr2RcdiTeItlnik0kFd3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwNCBTYWx0ZWRfX0LRupd/nMATB
 xRH1x3KPf+TeGsBgHzb9CxxubzjsPM3xnWjDFBXVrXb1xnl8dkY4T15BQGOP8AXD1NzuOTVMI9T
 vyt++8gNnq27pcVi2bYCJP2Zpv85C47f6+JnGasi5qzD4b22Pw8Tfd54sawYgj/G0nN6qX4T+2t
 KxWPoCxw7oflQSA8CrXDGMKVfJ2GY1fGWARKyxRnD13aQtZjs6NrRvJl8QAdmjvZRG/l8MnuZhS
 1G/MCeX/1CDgCgS9UnA+Qf1KwX9KGF/03p/MXyO2dxPmZjecD5qvqxQ2OqtIWFAs2LDX0H7HXO2
 1nPDh0fFMqwAjjUFIZbTuRTKdnI0IGr7TwS3bye7rcJIUN/UE+jxDh65KInj/nk1m1BgQN9b8vk
 KjCbgU2p
X-Proofpoint-GUID: 9tPi08vdJaon8TFVV3QLHKMPbM8_3wa7
X-Authority-Analysis: v=2.4 cv=co2bk04i c=1 sm=1 tr=0 ts=68cad003 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=8nJEP1OIZ-IA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=IMH0LFUbUW6ywGf4fkUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=0lgtpPvCYYIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_161356_631217_C09DAB13 
X-CRM114-Status: GOOD (  16.31  )
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

On Wed, Sep 17, 2025 at 04:00:22PM +0200, Thomas Weißschuh wrote:
> Upcoming changes to the generic vDSO library will mean that the vDSO
> datapage will not yet be usable during time_early_init().
> 
> Move the initialization to time_init() which is called later. This is
> valid as the value of tod_clock_base.tod does not change during the
> lifetime of the machine and the vDSO datapage is only used much later.

This is not true; tod_clock_base is a union and the tod member is changed
implicitly within clock_sync_global():

	tod_clock_base.eitod += delta;

However that happens only in stop_machine() context. Therefore moving the
initialization to time_init() is indeed ok, since it is called very early
when even preemption is still disabled.

I would appreciate if you would change the commit message a bit.

In any case:
Acked-by: Heiko Carstens <hca@linux.ibm.com>

