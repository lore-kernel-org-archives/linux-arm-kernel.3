Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FDECFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YyryhNyygboe2JvHqFf5MSMjhcrOpz4yYfzU98fo3A=; b=jrQhxFP9/m7wL7bYVbasxD03r5
	/MmrcREQJpYgLL2Wo4Q6EEhDSvtsHRgwOWvOuwx4q9regJiLASnD16hI2e9QZv4RC/OFsTeidCKL8
	6vg+TvcO4t1AQj4ou1F38EpbMyTLaCvzDfwODdCtX+zjwPIR9RrguW+DbqVNH0cppw2u3IS4mhvsJ
	8syKtDtgQepGuymfrDG/HZ5vnHqz9ppWNVQ2gdk9SlqwnzptkduTYOmqWdu2GLsFI3TwZjiLqdpOu
	1aEJTxs3kNZrkYAL1Ie9H2JwSgX+a8VAb/kI+yUiPp0XVQfha1TvUyF4qh7NleWZndv++WMp3pxbV
	TMelezwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOymY-00000000Usf-2nZo;
	Fri, 28 Nov 2025 13:45:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOymV-00000000UsE-42qS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 13:45:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8NuZh4191696
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 13:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6YyryhNyygboe2JvHqFf5MSM
	jhcrOpz4yYfzU98fo3A=; b=D40JwBYcqs5NnYnL8h52mHgXRtiJNyGmwQoJE7cS
	6GY9GALwqf7VFRYVUnZbpZWhBmb1h6PjxVXEYjLdvnh73HGCSUSu3NJSkhwCAszW
	e/xvrwtjU5QWYtRlCvcCh/myw4IkL9w7GT6vf0QyIrCS8DWxwJiGU5DKXlOLuv1g
	zQihRlOLAe2iPFqxHHE4kAr0wfwan7xpiXo6ZI7fqrTzIbldLrQ3/vrB5Ajdhui4
	4vC5jmZvAHoDRjbZEit0KYBB3hQTxd0yRv7POReM4WdnFKKCYQLUVpCoKTqBVoEd
	CcaPreSzHWnlwwWvNq9GFbirrIzAQ9Yifsj1kyku3CN3ng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58fhbqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 13:45:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f48e81b8so26002405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 05:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764337501; x=1764942301; darn=lists.infradead.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YyryhNyygboe2JvHqFf5MSMjhcrOpz4yYfzU98fo3A=;
        b=kS4Wdk6iXpyzR8Tx6vkl0Eu3YJq+wBzh6heaQK5dY8wp16jt8iY/4T/D4GR1XXPxtd
         +TivgHHI/Yc/k22wGpDZlRnbaybo7v2uHnUBspL6JRVjyU12bd/KDUGsT9fVch0ErWto
         WHJW6hbcgphDx6ATJ0XbkFbPgCXu5gqyQgbkj5+KknTcvJ88tM7AuFoBk6vgq5zA+gw3
         7Gexzq4W2OgBbI9MmY2dzyT11sr4LWaXd6xoFHEcPgzYXBFsBS9DMwWjupy+/K/WqSqr
         VCWA2C0UcCLq99FITGJ7IMKmS4/b+3V3Q10zGb/oFArf5/7f1Rly6RGCu5AKXlCC9rzw
         3iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764337501; x=1764942301;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YyryhNyygboe2JvHqFf5MSMjhcrOpz4yYfzU98fo3A=;
        b=KKDOx8R3p4r5PK7xFdSZa0NLv5kEHivX7HcbMMgVcn9mVeESEg0GyxnfIeuLHHNGny
         rSUe8EAf96UQIWZ4PoiwrF0H25Q/p2Ebf5oh+PKFrEF9HFb42anffPqfzpMI9i+kN6SE
         SJM7POr6DzCuGkwnM9IBF5TotM2riyFV05eDQImrr/mZU9WnzCB6c/HA/RQEUXtrt1WW
         jK5VokG/MR7y9PSbtWzZOC2p2Hqzp3c2FpmtAX5asly8Iql2pnKsZemdtnxthmn5l5Us
         ChAB2ukG3aZwwxQWBfWoKEhgfzbdY0kg/pF+CCrbVcnT+hn02AyQxoPVWc5PLzhEl+j4
         Ro0w==
X-Forwarded-Encrypted: i=1; AJvYcCXha+muGhnTAxXByXUeNSFCmXPIYneUFezSqwkP4fvfnKXeHSKwdguQyv53BHtdJRjc6udI5GSFwDKH+wuUIkVk@lists.infradead.org
X-Gm-Message-State: AOJu0YwYPsH+ahpsavP5nxqVasN0exUDbylF7jKtW31UOFZbx8FdyZah
	9iKqwb802AxeCXSbF652zfW1CkScadzX+a5LNKNpWJLeZ9OcurK+EPHb/B+DF/csuB/O5leKL3f
	2MbSalMTuq7JxyB7CmC84oj4oCn2xx8tKxBmsttocEUkEwDktGO6AqTVnx3yPIcoD1xVl88YX/A
	GkXw==
X-Gm-Gg: ASbGncs85d0JxRWxtoaAJ4eM7VEiIhY5gbsXxM+DqMq3KZkqcbsFawRYJ66xd5Rf+Wd
	fBoNvFBMxXnj1tSDhuxH9LKsNU8MzmAkxzAV1KU/RDHTtgpR65pdnDDE9YAF0xHHA0BOnEklsy9
	9eorinJlTv5QawKzm533zKSUnB9Ae5M8d9fT6PB/AHe7ffnhFfuTdkdTOjcbrxFC+BvpPzaluGS
	73gefgEdjocJY7MzzP1k1Oz4hFQeO2YAJBQqpDEv83N9RHjlnPKDfWQg6H8UyvmdCt9BicpvCr4
	eyKsJarQuGXZakOSYMKCHKtF0o7plSH8+NvLmr8tpJziwvr+qkvcR70j6GiAWO4ZNcxy86Uh/7d
	XgpqyghMDCMJd6EzJHlUDYj5EqmAdfMoRtKheSI/NGA==
X-Received: by 2002:a17:902:ea0f:b0:295:28a4:f0c6 with SMTP id d9443c01a7336-29b6bd53abamr329509865ad.0.1764337501443;
        Fri, 28 Nov 2025 05:45:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9TkAK8Rmvf0zxxdLd2ijdUeVHt1sgppFq66t5hDBI6qct1c8VXLlLvqtfClJadzxEfdM7VA==
X-Received: by 2002:a17:902:ea0f:b0:295:28a4:f0c6 with SMTP id d9443c01a7336-29b6bd53abamr329509475ad.0.1764337500900;
        Fri, 28 Nov 2025 05:45:00 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm47808035ad.37.2025.11.28.05.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 05:45:00 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------1nJtw7LajxHAbIw02IPdWaj5"
Message-ID: <cabf4c20-095b-4579-adc1-146a566b19b9@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 19:14:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] PCI: dwc: Support ECAM mechanism by enabling iATU
 'CFG Shift Feature'
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jingoo Han
 <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250909-controller-dwc-ecam-v9-0-7d5b651840dd@kernel.org>
 <20250909-controller-dwc-ecam-v9-4-7d5b651840dd@kernel.org>
 <alpine.DEB.2.21.2511280256260.36486@angie.orcam.me.uk>
 <c7aea2b3-6984-40f5-8234-14d265dabefc@oss.qualcomm.com>
 <alpine.DEB.2.21.2511280755440.36486@angie.orcam.me.uk>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2511280755440.36486@angie.orcam.me.uk>
X-Proofpoint-GUID: -UGKi_rHgte6kZ4KqFV9-9WR6W15af6e
X-Proofpoint-ORIG-GUID: -UGKi_rHgte6kZ4KqFV9-9WR6W15af6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDEwMCBTYWx0ZWRfXwIVkBdMPddu9
 E5NyII8ulSx6NA8gMvqmgRT0mAPqY1udIMbJFhh4GUq9XlzGm6jijYFDM1foEpkM8q+oB3pwAmw
 hkJKhthdMXlLXq09iuSorlXnWNQOSSQrmeREipndrRam99t2Lrthn9PsXjsj9VU6iE+6E3KJdzV
 EFIDbgNUg9AvmKBUjHSWLO7u7k1X1tRdLYZ8LAubaISjOWvoOgz7fgjBQ8rgj/99GoXidQ2PKCO
 r6igEyCRTiltl8FHdP/cZI42JNofpIvzjxEgolJuzVTqCjKgDx/yaFGGhYV+nfujjz1rfhe8MLU
 QFpHYfuCRwqWHBVnybgtwueVTh8NDem7hIPUMb+e3t8vAQgy12mxDtW6rjFErwdLIekqIf+5PaX
 c2Hqj6WKaJhm9O+nZyC3VyqD6x8qZQ==
X-Authority-Analysis: v=2.4 cv=E6DAZKdl c=1 sm=1 tr=0 ts=6929a75e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=r77TgQKjGQsHNAKrUKIA:9 a=bdmupUJtxhvzhX6DKHMA:9 a=QEXdDO2ut3YA:10
 a=x4N52Ti7FsAKUhfMTz8A:9 a=B2y7HmGcmWMA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_054504_147554_69B8142D 
X-CRM114-Status: GOOD (  35.47  )
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

This is a multi-part message in MIME format.
--------------1nJtw7LajxHAbIw02IPdWaj5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/28/2025 2:07 PM, Maciej W. Rozycki wrote:
> On Fri, 28 Nov 2025, Krishna Chaitanya Chundru wrote:
>
>>>> Designware databook r5.20a, sec 3.10.10.3 documents the 'CFG Shift
>>>> Feature'
>>>> of the internal Address Translation Unit (iATU). When this feature is
>>>> enabled, it shifts/maps the BDF contained in the bits [27:12] of the
>>>> target
>>>> address in MEM TLP to become BDF of the CFG TLP. This essentially
>>>> implements the Enhanced Configuration Address Mapping (ECAM) mechanism as
>>>> defined in PCIe r6.0, sec 7.2.2.
>>>    So this broke a parallel port on my HiFive Unmatched machine (a SiFive
>>> FU740-C000 based system), the driver no longer registers the device, no
>>> /dev/parport0 anymore.
>> Hi Maciej, can you share us lspci -vvv o/p with working & non working case and
>> also can you point us parport driver. - Krishna Chaitanya.
>   I'm not sure what you mean as to the parport driver; it's standard stuff:
>
> $ zgrep PARPORT /proc/config.gz
> CONFIG_PARPORT=y
> CONFIG_PARPORT_PC=y
> # CONFIG_PARPORT_SERIAL is not set
> CONFIG_PARPORT_PC_FIFO=y
> CONFIG_PARPORT_1284=y
> # CONFIG_PATA_PARPORT is not set
> # CONFIG_I2C_PARPORT is not set
> # CONFIG_USB_SERIAL_MOS7715_PARPORT is not set
> $
>
> I've attached output from `lspci -xxxx' so that you can decode it yourself
> however you need, though I fail to see anything standing out there.
>
>   If you can't figure out what's going on here, then I'll try to poke at
> the driver to see what exactly it is that causes it to fail there, but I'm
> a little constrained on the resources and completely unfamiliar with the
> ECAM feature (and the lack of documentation for the DW IP does not help).
>
>   I have no slightest idea why it should cause a regression such as this,
> it seems totally unrelated.  Yet it's 100% reproducible.  Could this be
> because it's the only device in the system that actually uses PCI/e port
> I/O?
Hi Maciej, Can you try attached patch and let me know if that is helping 
you or not. - Krishna Chaitanya.
> # cat /proc/ioports
> 00000000-0000ffff : pcie@e00000000
>    00001000-00002fff : PCI Bus 0000:01
>      00001000-00002fff : PCI Bus 0000:02
>        00001000-00002fff : PCI Bus 0000:05
>          00001000-00002fff : PCI Bus 0000:06
>            00001000-00001fff : PCI Bus 0000:07
>            00001000-00001007 : 0000:07:00.0
>            00001000-00001002 : parport0
>            00001003-00001007 : parport0
>            00001008-0000100b : 0000:07:00.0
>            00001008-0000100a : parport0
>            00002000-00002fff : PCI Bus 0000:08
>            00002000-00002fff : PCI Bus 0000:09
>            00002000-000020ff : 0000:09:01.0
>            00002100-0000217f : 0000:09:02.0
> #
>
> (Hmm, indentation does not appear correct to me for buses below 0000:07.)
>
>    Maciej

--------------1nJtw7LajxHAbIw02IPdWaj5
Content-Type: text/plain; charset=UTF-8;
 name="0001-PCI-qcom-Enable-iATU-mapping-for-memory-IO-regions.patch"
Content-Disposition: attachment;
 filename*0="0001-PCI-qcom-Enable-iATU-mapping-for-memory-IO-regions.patc";
 filename*1="h"
Content-Transfer-Encoding: base64

RnJvbSBhZDAwMjY2MWMyZTU1OWVlM2VjNTIzYjAwZTIzOTQ4NDA3OTY4Y2Q3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBLcmlzaG5hIENoYWl0YW55YSBDaHVuZHJ1IDxrcmlz
aG5hLmNodW5kcnVAb3NzLnF1YWxjb21tLmNvbT4KRGF0ZTogRnJpLCAyOCBOb3YgMjAyNSAx
Njo0NDoxNyArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIFBDSTogcWNvbTogRW5hYmxlIGlBVFUg
bWFwcGluZyBmb3IgbWVtb3J5ICYgSU8gcmVnaW9ucwoKU2lnbmVkLW9mZi1ieTogS3Jpc2hu
YSBDaGFpdGFueWEgQ2h1bmRydSA8a3Jpc2huYS5jaHVuZHJ1QG9zcy5xdWFsY29tbS5jb20+
Ci0tLQogLi4uL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtaG9zdC5jIHwg
MjQgKysrKysrKysrKysrKystLS0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1kZXNpZ253YXJlLmMgIHwgIDMgKysrCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2llLWRlc2lnbndhcmUuaCAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1ob3N0LmMgYi9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtaG9zdC5jCmluZGV4IGU5MjUxM2M1YmRhNS4uYTYw
ZjE1MzlmYWRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LWRlc2lnbndhcmUtaG9zdC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtZGVzaWdud2FyZS1ob3N0LmMKQEAgLTM2LDYgKzM2LDcgQEAgc3RhdGljIHN0cnVjdCBw
Y2lfb3BzIGR3X2NoaWxkX3BjaWVfb3BzOwogCiAjZGVmaW5lIElTXzI1Nk1CX0FMSUdORUQo
eCkgSVNfQUxJR05FRCh4LCBTWl8yNTZNKQogCitzdGF0aWMgaW50IGR3X3BjaWVfaWF0dV9z
ZXR1cChzdHJ1Y3QgZHdfcGNpZV9ycCAqcHApOwogc3RhdGljIGNvbnN0IHN0cnVjdCBtc2lf
cGFyZW50X29wcyBkd19wY2llX21zaV9wYXJlbnRfb3BzID0gewogCS5yZXF1aXJlZF9mbGFn
cwkJPSBEV19QQ0lFX01TSV9GTEFHU19SRVFVSVJFRCwKIAkuc3VwcG9ydGVkX2ZsYWdzCT0g
RFdfUENJRV9NU0lfRkxBR1NfU1VQUE9SVEVELApAQCAtNDI3LDEzICs0MjgsMTcgQEAgc3Rh
dGljIGludCBkd19wY2llX2NvbmZpZ19lY2FtX2lhdHUoc3RydWN0IGR3X3BjaWVfcnAgKnBw
KQogCiAJYnVzID0gcmVzb3VyY2VfbGlzdF9maXJzdF90eXBlKCZwcC0+YnJpZGdlLT53aW5k
b3dzLCBJT1JFU09VUkNFX0JVUyk7CiAKKwlyZXQgPSBkd19wY2llX2lhdHVfc2V0dXAocHAp
OworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAkvKgogCSAqIFJvb3QgYnVzIHVuZGVy
IHRoZSBob3N0IGJyaWRnZSBkb2Vzbid0IHJlcXVpcmUgYW55IGlBVFUgY29uZmlndXJhdGlv
bgogCSAqIGFzIERCSSByZWdpb24gd2lsbCBiZSB1c2VkIHRvIGFjY2VzcyByb290IGJ1cyBj
b25maWcgc3BhY2UuCiAJICogSW1tZWRpYXRlIGJ1cyB1bmRlciBSb290IEJ1cywgbmVlZHMg
dHlwZSAwIGlBVFUgY29uZmlndXJhdGlvbiBhbmQKIAkgKiByZW1haW5pbmcgYnVzZXMgbmVl
ZCB0eXBlIDEgaUFUVSBjb25maWd1cmF0aW9uLgogCSAqLwotCWF0dS5pbmRleCA9IDA7CisJ
YXR1LmluZGV4ID0gcHAtPm9iX2F0dV9pbmRleDsKIAlhdHUudHlwZSA9IFBDSUVfQVRVX1RZ
UEVfQ0ZHMDsKIAlhdHUucGFyZW50X2J1c19hZGRyID0gcHAtPmNmZzBfYmFzZSArIFNaXzFN
OwogCS8qIDFNaUIgaXMgdG8gY292ZXIgMSAoYnVzKSAqIDMyIChkZXZpY2VzKSAqIDggKGZ1
bmN0aW9ucykgKi8KQEAgLTQ0MywxOSArNDQ4LDI2IEBAIHN0YXRpYyBpbnQgZHdfcGNpZV9j
b25maWdfZWNhbV9pYXR1KHN0cnVjdCBkd19wY2llX3JwICpwcCkKIAlpZiAocmV0KQogCQly
ZXR1cm4gcmV0OwogCisKIAlidXNfcmFuZ2VfbWF4ID0gcmVzb3VyY2Vfc2l6ZShidXMtPnJl
cyk7CiAKIAlpZiAoYnVzX3JhbmdlX21heCA8IDIpCiAJCXJldHVybiAwOwogCisJcHAtPm9i
X2F0dV9pbmRleCsrOworCiAJLyogQ29uZmlndXJlIHJlbWFpbmluZyBidXNlcyBpbiB0eXBl
IDEgaUFUVSBjb25maWd1cmF0aW9uICovCi0JYXR1LmluZGV4ID0gMTsKKwlhdHUuaW5kZXgg
PSBwcC0+b2JfYXR1X2luZGV4OwogCWF0dS50eXBlID0gUENJRV9BVFVfVFlQRV9DRkcxOwog
CWF0dS5wYXJlbnRfYnVzX2FkZHIgPSBwcC0+Y2ZnMF9iYXNlICsgU1pfMk07CiAJYXR1LnNp
emUgPSAoU1pfMU0gKiBidXNfcmFuZ2VfbWF4KSAtIFNaXzJNOwogCWF0dS5jdHJsMiA9IFBD
SUVfQVRVX0NGR19TSElGVF9NT0RFX0VOQUJMRTsKIAotCXJldHVybiBkd19wY2llX3Byb2df
b3V0Ym91bmRfYXR1KHBjaSwgJmF0dSk7CisJcmV0ID0gZHdfcGNpZV9wcm9nX291dGJvdW5k
X2F0dShwY2ksICZhdHUpOworCWlmICghcmV0KQorCQlwcC0+b2JfYXR1X2luZGV4Kys7CisK
KwlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgaW50IGR3X3BjaWVfY3JlYXRlX2VjYW1fd2lu
ZG93KHN0cnVjdCBkd19wY2llX3JwICpwcCwgc3RydWN0IHJlc291cmNlICpyZXMpCkBAIC05
NDIsNyArOTU0LDcgQEAgc3RhdGljIGludCBkd19wY2llX2lhdHVfc2V0dXAoc3RydWN0IGR3
X3BjaWVfcnAgKnBwKQogCQlkZXZfd2FybihwY2ktPmRldiwgIlJhbmdlcyBleGNlZWQgb3V0
Ym91bmQgaUFUVSBzaXplICglZClcbiIsCiAJCQkgcGNpLT5udW1fb2Jfd2luZG93cyk7CiAK
LQlwcC0+bXNnX2F0dV9pbmRleCA9IGk7CisJcHAtPm9iX2F0dV9pbmRleCA9IGk7CiAKIAlp
ID0gMDsKIAlyZXNvdXJjZV9saXN0X2Zvcl9lYWNoX2VudHJ5KGVudHJ5LCAmcHAtPmJyaWRn
ZS0+ZG1hX3JhbmdlcykgewpAQCAtMTExMyw3ICsxMTI1LDcgQEAgc3RhdGljIGludCBkd19w
Y2llX3BtZV90dXJuX29mZihzdHJ1Y3QgZHdfcGNpZSAqcGNpKQogCXZvaWQgX19pb21lbSAq
bWVtOwogCWludCByZXQ7CiAKLQlpZiAocGNpLT5udW1fb2Jfd2luZG93cyA8PSBwY2ktPnBw
Lm1zZ19hdHVfaW5kZXgpCisJaWYgKHBjaS0+bnVtX29iX3dpbmRvd3MgPD0gcGNpLT5wcC5v
Yl9hdHVfaW5kZXgpCiAJCXJldHVybiAtRU5PU1BDOwogCiAJaWYgKCFwY2ktPnBwLm1zZ19y
ZXMpCkBAIC0xMTIzLDcgKzExMzUsNyBAQCBzdGF0aWMgaW50IGR3X3BjaWVfcG1lX3R1cm5f
b2ZmKHN0cnVjdCBkd19wY2llICpwY2kpCiAJYXR1LnJvdXRpbmcgPSBQQ0lFX01TR19UWVBF
X1JfQkM7CiAJYXR1LnR5cGUgPSBQQ0lFX0FUVV9UWVBFX01TRzsKIAlhdHUuc2l6ZSA9IHJl
c291cmNlX3NpemUocGNpLT5wcC5tc2dfcmVzKTsKLQlhdHUuaW5kZXggPSBwY2ktPnBwLm1z
Z19hdHVfaW5kZXg7CisJYXR1LmluZGV4ID0gcGNpLT5wcC5vYl9hdHVfaW5kZXg7CiAKIAlh
dHUucGFyZW50X2J1c19hZGRyID0gcGNpLT5wcC5tc2dfcmVzLT5zdGFydCAtIHBjaS0+cGFy
ZW50X2J1c19vZmZzZXQ7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtZGVzaWdud2FyZS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1kZXNpZ253YXJlLmMKaW5kZXggYzY0NDIxNjk5NWY2Li5kMjdiNDY5YjQxN2IgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5jCisr
KyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5jCkBAIC00
NzgsNiArNDc4LDkgQEAgaW50IGR3X3BjaWVfcHJvZ19vdXRib3VuZF9hdHUoc3RydWN0IGR3
X3BjaWUgKnBjaSwKIAogCWxpbWl0X2FkZHIgPSBwYXJlbnRfYnVzX2FkZHIgKyBhdHUtPnNp
emUgLSAxOwogCisJaWYgKGF0dS0+aW5kZXggPiBwY2ktPm51bV9vYl93aW5kb3dzKQorCQly
ZXR1cm4gLUVOT1NQQzsKKwogCWlmICgobGltaXRfYWRkciAmIH5wY2ktPnJlZ2lvbl9saW1p
dCkgIT0gKHBhcmVudF9idXNfYWRkciAmIH5wY2ktPnJlZ2lvbl9saW1pdCkgfHwKIAkgICAg
IUlTX0FMSUdORUQocGFyZW50X2J1c19hZGRyLCBwY2ktPnJlZ2lvbl9hbGlnbikgfHwKIAkg
ICAgIUlTX0FMSUdORUQoYXR1LT5wY2lfYWRkciwgcGNpLT5yZWdpb25fYWxpZ24pIHx8ICFh
dHUtPnNpemUpIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtZGVzaWdud2FyZS5oIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNp
Z253YXJlLmgKaW5kZXggZTk5NWY2OTJhMWVjLi42OWQwYmQ4YjNjNTcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oCisrKyBiL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oCkBAIC00MjMsOCAr
NDIzLDggQEAgc3RydWN0IGR3X3BjaWVfcnAgewogCXN0cnVjdCBwY2lfaG9zdF9icmlkZ2Ug
ICpicmlkZ2U7CiAJcmF3X3NwaW5sb2NrX3QJCWxvY2s7CiAJREVDTEFSRV9CSVRNQVAobXNp
X2lycV9pbl91c2UsIE1BWF9NU0lfSVJRUyk7CisJaW50CQkJb2JfYXR1X2luZGV4OwogCWJv
b2wJCQl1c2VfYXR1X21zZzsKLQlpbnQJCQltc2dfYXR1X2luZGV4OwogCXN0cnVjdCByZXNv
dXJjZQkJKm1zZ19yZXM7CiAJYm9vbAkJCXVzZV9saW5rdXBfaXJxOwogCXN0cnVjdCBwY2lf
ZXFfcHJlc2V0cwlwcmVzZXRzOwotLSAKMi4zNC4xCgo=

--------------1nJtw7LajxHAbIw02IPdWaj5--

