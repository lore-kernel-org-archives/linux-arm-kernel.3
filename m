Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E540AC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZy66iQM+cCUO66VN3PO/KS7q6/usEsFMj3s0ArP4FY=; b=vKexZMV5bNRF/539R302WobWM1
	axwdp4xa0Fr9Rb8GSnSt7QoesUZQi5GJCJh15UJ2fI4yX5meTNGabv4qdeJAyKTlkXf7i40IlASlC
	jMnaY08dfzvLLjL/Gs9xR9o5ro5sKrAkSOaACGv8FTtR6MyRIakDrBfauVjzRmtdYv2yjSwTtdrdq
	l1bRFyfh23/h9NgIJ2X9p8nJZEyTxPNAPYgonL7hraoWVwoV4VPN6HdBVBokVodMcjFvWUO7KXabL
	AKu8j+xQIK+Wffr/h343Z7bul2hkGcj2LLYAIK7lGTC3oB9iaw0+cSac0ZV34mqsgBloePmfMANrm
	m2QAeFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmchd-0000000Ei2v-0Qnx;
	Mon, 24 Feb 2025 17:57:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcg4-0000000EhjQ-2sRr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:55:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 512E75C45A9;
	Mon, 24 Feb 2025 17:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5E5C4CEE7;
	Mon, 24 Feb 2025 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740419734;
	bh=iqkWrOywlTXP+TDM/+KsWRJIvB4XNPt90mmD/JLzT0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTtrGwCLwqFKqlUaB703w6gzeptcDSmBfUQLrLJrmoZ4p7QDtQ3+4YD7WP1fznH8J
	 PrTlr+LEJBvILLPf2aTbY/nmh+A80nq3D3UzdUGGf/Tx+fHmIIlSWb8+f6eJIFfdwp
	 Ft93uF7IzZR1KMdDMftaaZs5RDZsO90n8DiyIa4AH48VxLDxs/ztBUjoqRScQn5DRt
	 iVsdR8uXu/3Vw9+Y/MWE08aEVn/eXEv8biYF9QCxnx8yGTNRRIXIwvg58N/OXFbsyh
	 /xQbZYZYEt+23lN3EJJPy/feOvM8KfTv9TVSMnFEpeubQOta48VEYJyb+DBrUjlpAe
	 PYaMHrFDm6BWg==
Date: Mon, 24 Feb 2025 17:55:27 +0000
From: Simon Horman <horms@kernel.org>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, virtio-dev@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 1/4] virtio_rtc: Add module and driver core
Message-ID: <20250224175527.GF1615191@kernel.org>
References: <20250219193306.1045-1-quic_philber@quicinc.com>
 <20250219193306.1045-2-quic_philber@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219193306.1045-2-quic_philber@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_095536_813058_906BB32E 
X-CRM114-Status: GOOD (  14.55  )
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

On Wed, Feb 19, 2025 at 08:32:56PM +0100, Peter Hilber wrote:

...

> +/**
> + * VIORTC_MSG() - extract message from message handle
> + * @hdl: message handle
> + *
> + * Return: struct viortc_msg
> + */
> +#define VIORTC_MSG(hdl) ((hdl).msg)
> +
> +/**
> + * VIORTC_MSG_INIT() - initialize message handle
> + * @hdl: message handle
> + * @viortc: device data (struct viortc_dev *)
> + *
> + * Context: Process context.
> + * Return: 0 on success, -ENOMEM otherwise.
> + */
> +#define VIORTC_MSG_INIT(hdl, viortc)                                         \
> +	({                                                                   \
> +		typeof(hdl) *_hdl = &(hdl);                                  \
> +									     \
> +		_hdl->msg = viortc_msg_init((viortc), _hdl->msg_type,        \
> +					    _hdl->req_size, _hdl->resp_cap); \
> +		if (_hdl->msg) {                                             \
> +			_hdl->req = _hdl->msg->req;                          \
> +			_hdl->resp = _hdl->msg->resp;                        \
> +		}                                                            \
> +		_hdl->msg ? 0 : -ENOMEM;                                     \
> +	})
> +
> +/**
> + * VIORTC_MSG_WRITE() - write a request message field
> + * @hdl: message handle
> + * @dest_member: request message field name
> + * @src_ptr: pointer to data of compatible type
> + *
> + * Writes the field in little-endian format.
> + */
> +#define VIORTC_MSG_WRITE(hdl, dest_member, src_ptr)                         \
> +	do {                                                                \
> +		typeof(hdl) _hdl = (hdl);                                   \
> +		typeof(src_ptr) _src_ptr = (src_ptr);                       \
> +									    \
> +		/* Sanity check: must match the member's type */            \
> +		typecheck(typeof(_hdl.req->dest_member), *_src_ptr);        \

Hi Peter,

FWIIW, this trips up sparse because from it's perspective
there is an endianness mismatch between the two types.

> +									    \
> +		_hdl.req->dest_member =                                     \
> +			virtio_cpu_to_le(*_src_ptr, _hdl.req->dest_member); \
> +	} while (0)
> +
> +/**
> + * VIORTC_MSG_READ() - read from a response message field
> + * @hdl: message handle
> + * @src_member: response message field name
> + * @dest_ptr: pointer to data of compatible type
> + *
> + * Converts from little-endian format and writes to dest_ptr.
> + */
> +#define VIORTC_MSG_READ(hdl, src_member, dest_ptr)                     \
> +	do {                                                           \
> +		typeof(dest_ptr) _dest_ptr = (dest_ptr);               \
> +								       \
> +		/* Sanity check: must match the member's type */       \
> +		typecheck(typeof((hdl).resp->src_member), *_dest_ptr); \

Ditto.

> +								       \
> +		*_dest_ptr = virtio_le_to_cpu((hdl).resp->src_member); \
> +	} while (0)
> +
> +/*
> + * read requests
> + */

...

