Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C249ED58CCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ej3Isx3J43WHcbqsXFspxuLWGfpG7XzaDk8RnET7IuY=; b=J0FJMZPNwp2ZEP7inqRhx+Y14W
	RKYjul/tkchCF0ibQ6+Q0Dz7eZMKHdpuLoso0DgCRnguSDkbK0QTkflyxQ2T0GN8H+t/Hif6/kJJy
	131cLFlGbvi02sJSWBmbrrIFGjIcgMu/uUy/J8CmmH5fHEnDr8LWV3urRFCp5FR0/BMnOYu1SecX2
	hKoLA0cOrev9qbYN9MsS+3V3G4iEIXh9ayhCG8o4pyRK6jXYModZhd5nHh3NfgVi/8kbhn0D/Pz6a
	AEZTXB49cmw2byILIFu8nt9dpBikvy+fI6/AG5BFlr2ey+WkizEaTXQcfBr49n7D9nuMP6SbOJ24p
	F6eT/n/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Ln-00000001SzR-1HiU;
	Tue, 24 Mar 2026 12:59:15 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Lk-00000001Swt-2Vz8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:59:14 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9UV8t564224;
	Tue, 24 Mar 2026 12:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ej3Isx
	3J43WHcbqsXFspxuLWGfpG7XzaDk8RnET7IuY=; b=Su7gQstz3B6aM6PFBG8uQh
	x01IvkgpF4akIkC2Yv8b74FadNo9e27ekRxXsakT3p1TARe7CZAY29h53xxd8wz1
	F4kZz+lkiD78vGhCs+laxqnB5u9xFRGK/Tsh6twYP7thvfsNIeWAGdP1jRWjsBE2
	2NrTa+0v/b8PhcVeJOs61gs29vpCXXnXjqWi5QPV0rxXNiDc7IpzG9wKPCFU1dJu
	hyIdXPUJ8IHi1NA9903kpVA7KAIe5DifhKuhpq4v9lSgLr3r1ewpvKEptBjvZ2uB
	zO3ARjeDVnRRo3nNzvOHwsDydcL2Hd5OJrLdyn0FWx65JkOT58sm1iZ5/kZyz6iA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d1ky02vr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 12:59:00 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62OCedC1011824;
	Tue, 24 Mar 2026 12:58:59 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4d27vk1pae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 12:58:59 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62OCwtnj51904902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 12:58:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8811920063;
	Tue, 24 Mar 2026 12:58:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD0782004E;
	Tue, 24 Mar 2026 12:58:54 +0000 (GMT)
Received: from [9.52.215.154] (unknown [9.52.215.154])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Mar 2026 12:58:54 +0000 (GMT)
Message-ID: <43139b81-2d3a-407b-9ddf-bd42aa70f780@linux.ibm.com>
Date: Tue, 24 Mar 2026 13:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] s390/ap: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        "K. Y. Srinivasan"
 <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>, Armin Wolf <W_Armin@gmx.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Mark Brown
 <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Alex Williamson <alex@shazbot.org>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux.dev, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260324005919.2408620-11-dakr@kernel.org>
From: Holger Dengler <dengler@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260324005919.2408620-11-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMSBTYWx0ZWRfX6N1fBrtwZrfl
 aNao0Xhwv2iPArpXTciFzlHehJzd3FqyuyxByqEu+FLvzIew8kt3PjWdYdZtO7Ev/dzu1juD33i
 ULiVxPJi+Eu3Wm01+pD7w41oOcB6CO0eS2PR+DcOqwrlrsqbZgbqKoknbOSccN4kN1AdGDnpSh4
 giT9HWCMECWpapxDaYdMQ/IXQp+iHi2011iYdnklc4+iAjB4tA8YcsPMKFTESeLitzfCKx7CeYa
 F5bfAZ1prh5bHCsbzFtvW6c4E94vHNefJ4W5xyDv5bTOpwX5xpUV089SzGXBpTCh2Tn6j/1RJAy
 8JrNkM5IZMTuuFxodSI3N0ItWWwaPezBykvTmfdz5CNBYNkZhJ/G7w4qUg5Kyf1QOlPIUBtuFZ0
 TaNFvnH1pIhI71CTLphAPYyjG3E9oMOG+wVPVi77oKaFO89fYZRslVgre89UqkZSjDGRx3OB3Tc
 tkfYq5p7x6UpUVDBiYg==
X-Authority-Analysis: v=2.4 cv=JK42csKb c=1 sm=1 tr=0 ts=69c28a95 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=JtdtG7AWE7AhTqZWL1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: umcwOVG9OGh_DW7scW8FgcsJPpy_MgAT
X-Proofpoint-GUID: iDlj1Pn5DnrzHKXcEcJoAVIWEUdMu_KQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_055912_759980_DC4431E3 
X-CRM114-Status: GOOD (  17.65  )
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

On 24/03/2026 01:59, Danilo Krummrich wrote:
> When the AP masks are updated via apmask_store() or aqmask_store(),
> ap_bus_revise_bindings() is called after ap_attr_mutex has been
> released.
> 
> This calls __ap_revise_reserved(), which accesses the driver_override
> field without holding any lock, racing against a concurrent
> driver_override_store() that may free the old string, resulting in a
> potential UAF.
> 
> Fix this by using the driver-core driver_override infrastructure, which
> protects all accesses with an internal spinlock.
> 
> Note that unlike most other buses, the AP bus does not check
> driver_override in its match() callback; the override is checked in
> ap_device_probe() and __ap_revise_reserved() instead.
> 
> Also note that we do not enable the driver_override feature of struct
> bus_type, as AP - in contrast to most other buses - passes "" to
> sysfs_emit() when the driver_override pointer is NULL. Thus, printing
> "\n" instead of "(null)\n".
> 
> Additionally, AP has a custom counter that is modified in the
> corresponding custom driver_override_store().
> 
> Fixes: d38a87d7c064 ("s390/ap: Support driver_override for AP queue devices")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Tested-by: Holger Dengler <dengler@linux.ibm.com>
Reviewed-by: Holger Dengler <dengler@linux.ibm.com>

-- 
Mit freundlichen Grüßen / Kind regards
Holger Dengler
--
IBM Systems, Linux on IBM Z Development
dengler@linux.ibm.com


