Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC09CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cf5Hiy8Ry8GA3Jd9aF9Qx8+o0rODNaBHOnWLQ2WctSg=; b=FlCZsetApCSVLRGz4cqY3kbMHH
	gw2CEI//DBVRO0VFDoK3BLVRPjLzmVYnOPP6efqdcrE/G7DAd5PDQ5VeRcGrJsaGsOAhbKgx7y6m9
	xgKBI7esxawVy6wgGX4gUdjbr0uGr6OyLRr+OC5EUCKfspZdnr+XxnfGR81Kwnml+O9+zZrbsrEeC
	+cn1cE48yrkOsi1c5Ms9ru+j4KSd0UEU4UoyntRyBWWw1/m4DG0cB5f5rtIQFYo9YORie7Y7Sh3bD
	S/E+ajWNtB5wnHsCZBaxNil62ostIg3eaimeJdMRd4t/QAyuE5iW9xe5rl1HwwFb0p64TJ7SvWpK9
	RoI84lkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuVI-00000003FvA-3fz0;
	Thu, 07 May 2026 08:54:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuVG-00000003FuQ-1N6F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778144080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cf5Hiy8Ry8GA3Jd9aF9Qx8+o0rODNaBHOnWLQ2WctSg=;
	b=MFvjFde11iYzdm3mVI3LHINm4abYpNT9toD8bxeXw7/ue8xLzO9LsvGqDd5y6nAVGKb1GV
	Y1AyvONVni0qfgklAKptx9IoIKbCnAib+5bsPp0I+iHxzKJyETJp9j6s7O04LsZzmSf9BA
	D5Sr8H12VIVEqt+snf/7uWRjZehd63k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-rUG7zCh3MHKK2oWShTvPpA-1; Thu, 07 May 2026 04:54:36 -0400
X-MC-Unique: rUG7zCh3MHKK2oWShTvPpA-1
X-Mimecast-MFC-AGG-ID: rUG7zCh3MHKK2oWShTvPpA_1778144075
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48906aa28cbso13292595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 01:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144075; x=1778748875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cf5Hiy8Ry8GA3Jd9aF9Qx8+o0rODNaBHOnWLQ2WctSg=;
        b=NVA5rpm8bl0XycwLsdqMnNkWSiqJgYIGS7cafdH+B6Mxr3l2PbizErEIIWCUbtNKP6
         SPZ19VMUg+mhDS5rVPP65E46fBNucfgoEIpWDIamRBkucev3STulZmysC3FWafeRRqRP
         /b8eFZIv2IMOGar2dvPak8gV2f+8CYYaXocWX0fFLTw9hJFpRFO2vUVbqagi+NbCmDRn
         OcS20FB+PG6O3FJwYJ/gfMUE/DAboZ0CjDbsTjLx13fvmcYyeJdDcRAwMDoznjqLUSbc
         XYnNx+DNSLq8tRipoM8rx7Ptq3tCxzTU/thbSTxZ91f+/VeU6WfX13qqN74AJt/ypY38
         GNcw==
X-Forwarded-Encrypted: i=1; AFNElJ+XnCJTJZopBfAxVKPVN7t4KzLLc2LB+K7pOc7kOy8DeTcU27hFCLYUraIVp+jHhlEDNUwUKl6Ng6CeghxpSIOF@lists.infradead.org
X-Gm-Message-State: AOJu0YyQcXlkI5akYfspoyuknzADM17pDUconcroe+xO6lh0KsfgyGeu
	7ResA1+u7xnRWQIPm4y29xE4Rrb+WFjh41rx30Y91m87O/UXHystZjCIB25c3LMSH0EP7hJkwRU
	TlQOX+fLAKBNW492a1mRJlhNhpqHA1/Bnp9sgpmfvbA7Kcw1XEKJxRDQK+ryp18oHK/aMHSgQBK
	qQ
X-Gm-Gg: AeBDiesY/AKdaXZYg3trqetyqOhjzZgiyNPIsUeRRTwZpnhDJ7r03i0nJHvsISTg2MC
	E7sLLc/AgQoW11rHHjgmIQhC1QpLzv8E6WpwMVvNIhU2raKtLSZigorFeoBQ44KL2As7/r4HG7w
	4Pn0rFeTypERaOj2vzJkMEcIYAtZna1hutAMFp+zD1I19yK78M5hhYN/+4n4Y3fUeW/OkHjyqdu
	Og9Yay1nv8PBbQqR71AGIrM3PYt2vwGpSZgvEdgMP+pCQ8Z5Uyj0uEpTI59pP1xcsyhs3uMAWUj
	ECeK7+xlSh8gYY7oaPfhQVP/qo3xPt/NlcDRJV0BR6yAYonXQWfwohm9gmwFRfKboAoaGeMULJ3
	jWpZTRK1swPMsKGX8w+2Wv9I2LCyJcNPm9zsAwX2p9BA0uU1fsvF+F2Zjp7WEB2YEiOOzbmsK17
	kv
X-Received: by 2002:a05:600c:3e10:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48e5e0089e0mr31312535e9.13.1778144075237;
        Thu, 07 May 2026 01:54:35 -0700 (PDT)
X-Received: by 2002:a05:600c:3e10:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48e5e0089e0mr31312015e9.13.1778144074746;
        Thu, 07 May 2026 01:54:34 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891163sm118910315e9.2.2026.05.07.01.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:54:34 -0700 (PDT)
Message-ID: <b7399930-ea04-4899-a760-ca1410065aac@redhat.com>
Date: Thu, 7 May 2026 10:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 09/13] net: lan966x: add PCIe FDMA support
To: Daniel Machon <daniel.machon@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>, UNGLinuxDriver@microchip.com,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Herve Codina
 <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260504-lan966x-pci-fdma-v3-0-a56f5740d870@microchip.com>
 <20260504-lan966x-pci-fdma-v3-9-a56f5740d870@microchip.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260504-lan966x-pci-fdma-v3-9-a56f5740d870@microchip.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v5IADF_w8oF15mvHII5hlUlZwaceTL2bUTn4u0rghrM_1778144075
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_015442_440236_FD891D00 
X-CRM114-Status: GOOD (  12.43  )
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

On 5/4/26 4:23 PM, Daniel Machon wrote:
> +static int lan966x_fdma_pci_rx_check_frame(struct lan966x_rx *rx, u64 *src_port)
> +{
> +	struct lan966x *lan966x = rx->lan966x;
> +	struct fdma *fdma = &rx->fdma;
> +	struct lan966x_port *port;
> +	struct fdma_db *db;
> +	void *virt_addr;
> +	u32 blockl;
> +
> +	/* virt_addr points to the IFH. */
> +	virt_addr = fdma_dataptr_virt_addr_contiguous(fdma,
> +						      fdma->dcb_index,
> +						      fdma->db_index);
> +
> +	lan966x_ifh_get_src_port(virt_addr, src_port);
> +
> +	if (WARN_ON(*src_port >= lan966x->num_phys_ports))
> +		return FDMA_ERROR;
> +
> +	port = lan966x->ports[*src_port];
> +	if (!port)
> +		return FDMA_ERROR;
> +
> +	db = fdma_db_next_get(fdma);
> +
> +	/* BLOCKL is a 16-bit HW-populated field; reject obviously-bad
> +	 * values before they feed memcpy/XDP sizes.
> +	 */
> +	blockl = FDMA_DCB_STATUS_BLOCKL(db->status);
> +	if (blockl < IFH_LEN_BYTES + ETH_FCS_LEN || blockl > fdma->db_size)
> +		return FDMA_ERROR;

Pre-existing issues reported by sashiko (most of them actually) can be
safely ignored/postponed to follow-ups, but the above OOB (and in patch
11/13) access looks real and IMHO should be addressed.

/P


