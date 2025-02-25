Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F54FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IHovyha28nioMj0jqE8NRMLQetpUZ7DfOvIv8poExM=; b=UfRhj/+F5Fa51wJ+RNX7QidzHF
	Aku38aYNrCqmP69WQmIsvyCllSfxOluTXnIJwhbEPnz9JVAcAObx0Jyrgbs1HXZpyw5Pyxc1FGC9B
	R3O+qCOJQctHlXfnvp2yC93uG4afPauegmHQ6ct/A0FT4oJnJD7FLTE/IfCA2bZCwydJMlFgTt1ek
	xZvWFWpnqS5Eez9xlXKJ/c9Hz397mHO4GRDVm0D6m383r65UB+moN/FA3tnopUq+8BG2w99+La1nB
	/5PHeYI2EQz/wN0QT5B/E5aK4Xcsdg9ZHoDYqoWs1Wf3s/+r6EYRELhTxkexHMt2oD5/jm5tBjQ3D
	zep+PPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuWe-0000000HHZH-3Fmh;
	Tue, 25 Feb 2025 12:59:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmu0w-0000000HCw1-1TXw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:26:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8opm3017279;
	Tue, 25 Feb 2025 12:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0IHovyha28nioMj0jqE8NRML
	QetpUZ7DfOvIv8poExM=; b=MgZ1qVeMHziA3NjUeIktz0lRkFkt84zUSVCHzFOF
	ftahvEwnHUo2X9IQKvrYmUYKq3sE8TU0JCA6sPeVm88RZXGtSHmRhD5lZvYH1Ff4
	4nF2R+dLz9nVZaAG52/awz01r18ezkIee+LNcOj0v2QZOpVdOlmZzmsmWm0AkIvZ
	NNXDLNO/SSjrLJvCNQOfJ4iUFuckZZ/f56VbQdn4pQw1sQvgL/t2F0HcAaqfhzpS
	lgFULua2cNK+oIR/yu/22vWF0QwuKX1v1IhK6IUe4tTaKdmOnIP/+KbaHngfPkKV
	Oqzm4YX0K6OUhldPHDYAXG6GEj9lmKpJ6NZx7WOrFNQT4Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5k68y11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:26:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51PCQ1K8028313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:26:01 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 04:25:56 -0800
Date: Tue, 25 Feb 2025 13:25:53 +0100
From: Peter Hilber <quic_philber@quicinc.com>
To: Simon Horman <horms@kernel.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri
	<quic_svaddagi@quicinc.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Eugenio
 =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-kernel@vger.kernel.org>, <virtualization@lists.linux.dev>,
        <netdev@vger.kernel.org>, David Woodhouse
	<dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>, Marc Zyngier
	<maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano
	<daniel.lezcano@linaro.org>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Parav Pandit <parav@nvidia.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        Cornelia Huck
	<cohuck@redhat.com>, <virtio-dev@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5 1/4] virtio_rtc: Add module and driver core
Message-ID: <uj7g35pvelxwnukbkii6d7kzc4pjsj6wrtbcuomg3vhdluoxap@owoy3uy3xcrr>
References: <20250219193306.1045-1-quic_philber@quicinc.com>
 <20250219193306.1045-2-quic_philber@quicinc.com>
 <20250224175527.GF1615191@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224175527.GF1615191@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OOjFz1sTOj6eqEabv-mV79KYBvcBXkId
X-Proofpoint-GUID: OOjFz1sTOj6eqEabv-mV79KYBvcBXkId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_042618_509816_EF6B377C 
X-CRM114-Status: GOOD (  23.48  )
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

On Mon, Feb 24, 2025 at 05:55:27PM +0000, Simon Horman wrote:
> On Wed, Feb 19, 2025 at 08:32:56PM +0100, Peter Hilber wrote:
> 
> ...
> 
> > +/**
> > + * VIORTC_MSG() - extract message from message handle
> > + * @hdl: message handle
> > + *
> > + * Return: struct viortc_msg
> > + */
> > +#define VIORTC_MSG(hdl) ((hdl).msg)
> > +
> > +/**
> > + * VIORTC_MSG_INIT() - initialize message handle
> > + * @hdl: message handle
> > + * @viortc: device data (struct viortc_dev *)
> > + *
> > + * Context: Process context.
> > + * Return: 0 on success, -ENOMEM otherwise.
> > + */
> > +#define VIORTC_MSG_INIT(hdl, viortc)                                         \
> > +	({                                                                   \
> > +		typeof(hdl) *_hdl = &(hdl);                                  \
> > +									     \
> > +		_hdl->msg = viortc_msg_init((viortc), _hdl->msg_type,        \
> > +					    _hdl->req_size, _hdl->resp_cap); \
> > +		if (_hdl->msg) {                                             \
> > +			_hdl->req = _hdl->msg->req;                          \
> > +			_hdl->resp = _hdl->msg->resp;                        \
> > +		}                                                            \
> > +		_hdl->msg ? 0 : -ENOMEM;                                     \
> > +	})
> > +
> > +/**
> > + * VIORTC_MSG_WRITE() - write a request message field
> > + * @hdl: message handle
> > + * @dest_member: request message field name
> > + * @src_ptr: pointer to data of compatible type
> > + *
> > + * Writes the field in little-endian format.
> > + */
> > +#define VIORTC_MSG_WRITE(hdl, dest_member, src_ptr)                         \
> > +	do {                                                                \
> > +		typeof(hdl) _hdl = (hdl);                                   \
> > +		typeof(src_ptr) _src_ptr = (src_ptr);                       \
> > +									    \
> > +		/* Sanity check: must match the member's type */            \
> > +		typecheck(typeof(_hdl.req->dest_member), *_src_ptr);        \
> 
> Hi Peter,
> 
> FWIIW, this trips up sparse because from it's perspective
> there is an endianness mismatch between the two types.
> 

Thanks, I took a closer look and I think a virtio_le_to_cpu() inside the
typeof()s will both keep the sanity check working and keep sparse from
complaining - in the below case as well.

Peter

> > +									    \
> > +		_hdl.req->dest_member =                                     \
> > +			virtio_cpu_to_le(*_src_ptr, _hdl.req->dest_member); \
> > +	} while (0)
> > +
> > +/**
> > + * VIORTC_MSG_READ() - read from a response message field
> > + * @hdl: message handle
> > + * @src_member: response message field name
> > + * @dest_ptr: pointer to data of compatible type
> > + *
> > + * Converts from little-endian format and writes to dest_ptr.
> > + */
> > +#define VIORTC_MSG_READ(hdl, src_member, dest_ptr)                     \
> > +	do {                                                           \
> > +		typeof(dest_ptr) _dest_ptr = (dest_ptr);               \
> > +								       \
> > +		/* Sanity check: must match the member's type */       \
> > +		typecheck(typeof((hdl).resp->src_member), *_dest_ptr); \
> 
> Ditto.
> 
> > +								       \
> > +		*_dest_ptr = virtio_le_to_cpu((hdl).resp->src_member); \
> > +	} while (0)
> > +
> > +/*
> > + * read requests
> > + */
> 
> ...

