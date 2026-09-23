Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AC1C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=; b=Ri2/u6QIvlqxeD/+0/0QlGORfA
	Wp40TMJ4aZWMrCErLVhf2meYEUBAbQeGy72yXz8gCEXBAgTu09eBFuVqWRSf3wi2HgG1a/IB2tXuR
	AzOzC/KaqoDsYxG11kA6CJ8hESc8lcn6vnurApDed2vBB3GnnmzHpj2wEdfeDqhnP9Qqhk6iXyTQ/
	xQJybMwEivlVDiz3SStwZzt6XvcG7u6NUFgmI5DX9c2Fq12GP3/g62Rf2mqCnRLenTOldd7LSXqYP
	+qBDD2Vd5+KDag59cZH1C6QlT+KxQH82U8JhKGj5lx1wv5mLTgIDBFqO9NjYd4ao4c75/25BiQk87
	TJu8n9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NIF-00000008Rhh-1m14;
	Wed, 23 Sep 2026 13:45:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NIC-00000008RgC-1cgL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:45:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDLq4k3842694
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=; b=NHhZfGytzmWFyCsj
	Zbq1+A+FQqTZC64KnzfYTjTVPG4qQ2PppdfaDev7x8JA0PLgl8xEusRGtaUk2Jnu
	dktSsj6AkBdohfO4tO1sewfq6TnnSSJAfWsSJiulrAuLH1YzPMPiVH1eN1YzL+gr
	rXl5tjJO3b9ESRI7PcAkNumaqBIipyJqWDIi7+ikcMskQZRd0A3wRk2DfxasF1it
	2mcq9TNtRWWuNicMFsLObGoyuSiP7WGMx9NrG7MnL3ooMu+9W0VVVhVHfTo5swQf
	RGt6T1OymuOg3EfZA02+riv6lxDfUWyRTWk+mzOgJ+2ZyLA7Gl/eBGkdBvnXp9gg
	Mxdl+Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbg342-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:45:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a57ef025a3so61519137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790171146; x=1790775946; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=;
        b=EMpQR5xlqhAJM9pLB+7fEwJSmv4QeW5aMiPmMcxdlMdHOSCBjOBfEmxmtEvAXIo5a/
         T4glFYc3k3088wRPO7h5byqqkPf3c3849sM9yjBoPhW3EdnN1R0SEEZHeqNckr1kF1DG
         H0K7gjxfjGypB69KYc+RdFDuFBR3R2WVblWo2gFKqoFJwlJxefo3FEyhAG/r+42qHSvO
         QZUEkedj8zmdVuOOAgOtUZTfKaVb8X/1uMnPGyoUQN1JrD/rBylyz5OY5JpR/tEThmdh
         b/XSIQUfz3nWwvaAwW97EzuoA+kR/SrwnARw1XQczXzhNzEhADk0YWCvoAZaC30lF5zy
         P7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171146; x=1790775946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=;
        b=lxMsQ04VeDnZ6BFdk/cOTqFIFaVI2+8B2gyt0F/BY9CXKLX0JmUbHlzsQzQrhYfA5+
         U6jTP5m+IVJXsEeb8myVpaYltlRsaybuNz3muaaI+W9n8eUd6U/6Njxd5bcJKYGHcMtJ
         yscqT4PI+XbDk9S5grPSUbUES+v56fz3NJAFePhdgi8pGcTv1uxLG4Hp+eXE2TtspnFN
         EsoVZS0/QnqZs5HYtB+1O+OtyAjAkLuxXJdSC1lIDmR7D6SHzatRYyKYxDdPNjf23NnV
         FIlNOhKaixL5J+bTnjCcD75MJCqBZzdO/PLxMsU5C/TZcXp0rKTPjmBhB16C5N8vkoVH
         qrdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaTomzskqWZFVrNKLt7xT5zJHd9seZxsCS7+kFuqGARYnBji9O0xBhfErTMt+qrsE8Y3ROWWpRAaQqGCHgSogA@lists.infradead.org
X-Gm-Message-State: AFuF++lQrfO41EnpxPSZcadJf+6Z+yxs12xvVN9KwSGrlHeI0jzFGPRe
	dIYOtqxxJFCJcANEB2dYED7rXE5uctVd5u8z0vIahLxBkbc34/0kNeUwArePe8F+I3yjqO2IUWj
	as2YJRdWCw71HNHO0qVmBc25tQkO78XpXFiDIgxQJZ9vxi1tB1YkJot5cC6CWJHuDEN+5oF822I
	lI9g==
X-Gm-Gg: AYBFou0XLf4R3Ethextvl5ByDIDOJIQfjUx9sthVkeXniS9rBVJSpqDylZV0iIXuCwQ
	jJ5FHgRiB+cgRwfI98iw9UgtOPHd8AP+/8xLtDxtxZ1J7ll+5t2TQbRDPU2bu+bgAVHprmECC4e
	ooeGxzPMyZm0+I2LCvoHlQtzzua7i4Mbf2c/beLEU+7uuZmiuoZe6WwKLnTIcV7ROGCgxya48hA
	ivhmIZXwtqz7EzkyJ9Yu93PeNTCSN3rv2PY/cyM7oyeXI7mVLGGklpOV+Isy4IMJH5A+8O0ysuq
	VBQck6MkQBV9MWiLgqDD/TCtBc2eEUyRtmHLGRFeORAy6BDG7sfEjNqtczEDFWwehX42X2jjHSj
	8nUq+oCDqtuP4d4XQqmMaoQ==
X-Received: by 2002:a05:6102:5121:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7ac1c454b57mr2548253137.2.1790171146480;
        Wed, 23 Sep 2026 06:45:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7ac1c454b57mr2548220137.2.1790171145961;
        Wed, 23 Sep 2026 06:45:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37478c9sm1722267a12.0.2026.09.23.06.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:45:44 -0700 (PDT)
Message-ID: <32bceb7e-d06b-4537-9d34-91bfe27f4ff7@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/16] usb: hub: Associate port@ fwnode with USB port
 device
To: wens@kernel.org
Cc: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-7-wenst@chromium.org>
 <c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com>
 <CAGb2v66c8L20yNNmvj6TaQbS7LnqAyuv0tMQfj+0PSjMUcSByA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGb2v66c8L20yNNmvj6TaQbS7LnqAyuv0tMQfj+0PSjMUcSByA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX+EXPLvpKayOR
 qljTpAcN4nWjtZGxydqkehmK6NmnB7SrjTNPcnYSdVOeBbzn0colxbKwS0N9zm8tJ3+bd//Olel
 pI23LERFl9Koa16FLM/WOoyhhbh+A+E=
X-Proofpoint-GUID: gK1PEn_RzuYOgR6JftGQuGYKsE9VVe25
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab3d80b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7ONEjnSaIfHBpTaVFwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX3RyyOp8Fxbl7
 QrqN/v9/BtrRllM48BeIJwzVHn90oQMaO7DMMEvqb81urMTyZGfvURguJdx0ztyaNTRZL1+aIlk
 jKt7VtJgfNReo65Yxgk6GsO0o/hBT/NVQtJlL9/bUKFf5W9bOR48nmjhejhUykh+ko55k4FSPs7
 c9XcgZei8Ngj6QPcO5uTnathz+R2pNzKax3JwAkiybvwAouFK0xXYsyUPUsbogLfm0WCiLkbCDs
 A5aFe3hmdUFtghcGFyivZ95wiwMDibwGurOqN067BLnM5Qmi3KxRGSdx+M3JxZwVtis5x2zkTWC
 gEHxdT/OV3VUK2uUslTNAD2UuUPUHKkCWUBSg702HXjw1psvmH7P99WgCnfN7vBETTEQW90XhKD
 UkPQvhlah+YW3NU8zG6xszx35LwuFxhc0BI/ftlU6p0a5f2SY5Up/8xvw/bv6az2hAB+KHMcGvj
 yfksmgNtjoL71SBQOuw==
X-Proofpoint-ORIG-GUID: gK1PEn_RzuYOgR6JftGQuGYKsE9VVe25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_064548_562242_BE0A1E64 
X-CRM114-Status: GOOD (  31.15  )
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

On 9/4/26 12:30 PM, Chen-Yu Tsai wrote:
> (dug this out of my kernel.org email)
> 
> On Fri, Jul 31, 2026 at 10:44 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
>>> When a USB hub port is connected to a connector in a firmware node
>>> graph, the port itself has a node in the graph.

[...]

>> But something I faced when I was poking at USB4 was that dt-bindings
>> currently assume every controller is effectively single-port and the
>> of_graph ports under it represent HS/SS lanes, i.e. the entire
>> "ports" subnode represents a single USB port
> 
> Which controller is this? AFAIK for xHCI hosts there currently is no
> "ports" node specified in the common usb-hcd.yaml binding. I plan to
> add this separately, as it can already be used for USB A connectors.

DWC3, the qcom flavor specifically (qcom,snps-dwc3)

> The kernel maps every downstream port of the root hub to a separate
> node. On the XHCI it is more complicated because it has two root hubs,
> one for HS and one for SS. I'm not familiar with the hardware specifics
> but they seem to map into one common namespace, so you probably get
> ports 1~8 for HS and then 9~12 for SS. Note the number of ports is
> different. This is just an example from my x86 workstation. And on
> x86 each port is mapped to a different ACPI node.
> 
>> I think the solution here would be to do ports {} under the controller
>> and have every one of them have 2 endpoints (for HS and SS
>> respectively) - then, each DT-port would correspond to a USB port
>> (sorta like in the hub case, minus the hubs are split for HS/SS so
>> they have just a single endpoint under each port)
> 
> But the hardware descriptors actually give two ports, one for HS and one
> for SS. And in the case of dwc3, I suspect that they always come with
> one downstream HS port and (optionally) one downstream SS port. So the
> binding is actually correct, except for the numbering.

Ohh yeah I overlooked the HS/SS port split.. I think you're right!

> I'm looking into the dwc3 case. Changing the numbering might actually
> not break anything. Linux seems to just need one *a* graph connection,
> but doesn't care about the number. I looked through some other projects:
> 
> - FreeBSD doesn't use the OF graph for anything
> - U-boot doesn't use the OF graph for USB
> - OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use the
>   OF graph for USB
> - coreboot doesn't use the OF graph for anything
> - Zephyr doesn't support dwc3
> - TF-A doesn't use the OF graph for anything
> - EDK2 doesn't support dwc3 and doesn't support OF graph
> - OP-TEE doesn't support dwc3 and doesn't support OF graph
> 
>> But that comes with a big breakage, as always..
> 
> As I mentioned, it probably isn't as large of a breakage.

That's very welcome for a change! Thanks for checking all of them.

Konrad

