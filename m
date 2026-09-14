Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E6FC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKSIBT+jPeW8pejlbEWHl5sVzP1rg7BJWTH4v/8qNGY=; b=Yw2JMSJ3R/8je05MHHNPRowh8e
	/T8dl9vVECQiCxsyPQBYttghYIVEXLZSqMXgyrsKOnOpOu0XYGLAtSFxMXHEhoWJweFV+R79SUW3a
	uyw5MMP+oDO1dDV29k5dn/LjtojkCTSbeYpA6fBzmHVDSwv2EyLIyvhGzURjlsrfxkDdCz58F2xJm
	Zz1ixII9vZmwN3AhOGYeCPrPLPQGbvnYZNdH5lns3AYyafhHMV2Tyw4x0pYFA5xS0xL1qpif3mxjq
	wy/r6x+dtLtypEre6T7Ks5w6qWk57+HL0H/ZyjPmf9HC7Kr035BakqKZto1BoGIVcOHQsmka7sMBs
	0zDkjyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69TP-00000004HNm-2DKh;
	Mon, 14 Sep 2026 16:24:03 +0000
Received: from out-84.mta0.migadu.com ([2001:41d0:1004:224b::54] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69TM-00000004HN2-1Jk2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 16:24:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+462xxdyeMC1GN/R2WQFu0vf/hv5y4sjHsNqOzNci58=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789403037; v=1; x=1790007837;
 b=ffaY/ToM5HK499t24w0ukSoj7is2AMn/UjUbdEpdwC0eDXjk+I2iI4AQa/O8+KE991LYW7tF
 51kFw7GoyS9WrPi0pai5cWjKzyOxz7ejPJz3PMM5pNSN7PKWc5KDa6xcofBhz5WTQcYXWajzDw0
 Rn0Y9m7/GJZCOzOpyABnuxCg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cc250bccb71943b3;
	Mon, 14 Sep 2026 16:23:57 +0000
X-Mizu-Trace-ID: cc250bccb71943b3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so9852e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:23:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy1BGhfYpMowLt1VKN6O/AeWijIIiQlenJpzaHNVftkMhb1i5fopIBXHKTDQzxWB7BZ1AF9um8SX0lCcz54utSs@lists.infradead.org
X-Gm-Message-State: AFuF++mv8o2myh/uwZHT55J6guHdfYDxK44//s4vwWopDbwmUQfipxe9
	VRkJj9jptUopaLAbX+UeoxOYTF5iSNBLnDaKmYYmB0OqXD3EK9HFhcwZ1Gaz2Up7mmdPzvVj2Ee
	KYmGZvpdUpYS0BwMhk5hsBDT8JxmQb/NZkijeEG7T
X-Received: by 2002:ac2:5681:0:b0:5ae:b1b3:145a with SMTP id
 2adb3069b0e04-5b8ae4c4829mr98689e87.6.1789403036316; Mon, 14 Sep 2026
 09:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com> <20260830-host-direct-messages-v7-1-45f6e6db72c2@google.com>
In-Reply-To: <20260830-host-direct-messages-v7-1-45f6e6db72c2@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 17:23:19 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx54xunFQxmAo_Ub+C4ZhhPvhixdkenfWV4rkF0jPCNsA@mail.gmail.com>
X-Gm-Features: AcwNN1X2uetrRmFIoGYENcfcuU7e1BdSXNmH8r5ZduL9wOubCa5NrjEj-eVtpTM
Message-ID: <CA+EHjTx54xunFQxmAo_Ub+C4ZhhPvhixdkenfWV4rkF0jPCNsA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] KVM: arm64: Block host-initiated FF-A direct responses
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Sebastien Ene <sebastianene@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_092400_497643_296340C7 
X-CRM114-Status: GOOD (  11.45  )
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

Hi Per,

On Mon, 31 Aug 2026 at 00:08, Per Larsen via B4 Relay
<devnull+perlarsen.google.com@kernel.org> wrote:
...
> @@ -686,8 +686,10 @@ static bool ffa_call_supported(u64 func_id)
>   case FFA_MSG_SEND:
>   case FFA_MSG_POLL:
>   case FFA_MSG_WAIT:
> - /* 32-bit variants of 64-bit calls */
> + /* The host is never the target of a direct request */
>   case FFA_MSG_SEND_DIRECT_RESP:
> + case FFA_FN64_MSG_SEND_DIRECT_RESP:
> + /* 32-bit variants of 64-bit calls */
>   case FFA_RXTX_MAP:
>   case FFA_MEM_DONATE:
>   case FFA_MEM_RETRIEVE_REQ:

Sashiko asked whether the interfaces it listed should be added to the
blocklist too. For FFA_FN64_NOTIFICATION_INFO_GET the answer looks
like yes: FFA_FN_NATIVE() is FFA_FN64_##name on arm64, and
ffa_notification_info_get() is the only in-tree caller, so the 32-bit
entry a few lines below never matches what the host sends. Could you
add it here?

The other three aren't the same case. FFA_RX_RELEASE has to keep going
through, since the host's release is what frees the hypervisor's RX
buffer after do_ffa_part_get().

Cheers,
/fuad

