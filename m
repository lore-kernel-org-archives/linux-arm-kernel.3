Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD4FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 20:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpn2IgbKGrTggO+5MYIlxTrWJGnctnmaJp03+CTcNbQ=; b=oKgB63pHTrkT0iwya1BKETogl/
	HD4wuHHGRCXQQW9hpzbh5bdG8GfF/OChkvYr6jkP5n+6JuWgebdx5TA8fqVpLXZHncGD5r7tQmnW8
	bRPUBoVu/HBqUWJc3KIEt8LdwylunrYFodWZjobjbLB/28OXFRZVFBc3wP6M6sfQ1FZZyHUoNSHzj
	xGVcn8R04bGpK4QWoFlQdDo/CKx1kisAnl3YjHCFVnfD/9MapB+I2hEaUy6AudmD5/t8xLjxqx2te
	QdPoytyt0C5UjnFmc/Fymmt2/V0V5UsQQKdK6Jn/HKl7FCkErrl7bcCH0XzCIl+Ix//jDeOMo+A7x
	phrsYLYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiI3q-00000005j5m-0Lt0;
	Fri, 10 Jul 2026 20:43:02 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiI3n-00000005j5M-3UAu;
	Fri, 10 Jul 2026 20:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783716177; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZyUydZzLCJqQ8wHcsSMHJlKTS8z/av6o2hGJJdBy8M1k5t9U7f0WFGpaIroEhcsIePuq8C7FHzGNBL0Ii88bns9s9EdgQKTHBo8WE8Fr+eRTkbrZpytgsQ0JhMa9vnViAC85rpb1YaiazTbAJ95Jwm5daANU6YKk66qlpO/Mxek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783716177; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bpn2IgbKGrTggO+5MYIlxTrWJGnctnmaJp03+CTcNbQ=; 
	b=MMCjpRRyJxtIpWTstuncaP6v+wBiS/7282bPwZu/2MP1cdBfLadH5jrWGthdUuQ9DuZrJLhrMmJiBio4lgrL6/w/hHAtTN7epLc4Qb5DJ9qem8mQ7D3VPoA9lNeKEtYkz9QIVEmsLfmalXAulHwQbgGaG3fjvTd0eiYlW+bKU7Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783716177;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bpn2IgbKGrTggO+5MYIlxTrWJGnctnmaJp03+CTcNbQ=;
	b=I9JNKRuXOnNk4XkmPx9tXSx/ngxfTyoLiiRCSqtZR2WaTQLmD/Wa6bXMuvL7Mrqs
	i4KHNLDNZa30uB99Q1MFbaC882rFxFWJ0J9sObXLuMKm7vdpkPwTnZEOyK4xKnxSQdh
	RSd9na5LYg7gknWD+0V5MoTYSIgwHruYTGzjp4UM=
Received: by mx.zohomail.com with SMTPS id 1783716174951831.1292117639873;
	Fri, 10 Jul 2026 13:42:54 -0700 (PDT)
Message-ID: <a6a32617-f3c9-4cf2-b020-daecf7ec18f1@collabora.com>
Date: Fri, 10 Jul 2026 22:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] media: mc: Implement shared media graph
To: Paul Elder <paul.elder@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com
Cc: xuhf@rock-chips.com, stefan.klug@ideasonboard.com,
 dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 hverkuil+cisco@kernel.org, nicolas.dufresne@collabora.com,
 ribalda@chromium.org, sakari.ailus@linux.intel.com
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
 <20260619052637.1110672-2-paul.elder@ideasonboard.com>
 <178229758404.3075020.12553514371020830845@ping.linuxembedded.co.uk>
 <178237578321.292172.5229006087283359591@neptunite.rasen.tech>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <178237578321.292172.5229006087283359591@neptunite.rasen.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_134259_953956_6E80B004 
X-CRM114-Status: GOOD (  16.14  )
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

Hi Paul,

On 6/25/26 10:23, Paul Elder wrote:
> [...]
>>> +// TODO figure out locking for when multiple drivers touch the media graph;
>>> +// maybe macros for shared versions?
>>
>> Do you mean for when drivers are trying to change link state directly?
> 
> I meant for all the operations that act on media device. I'm not sure what
> there is because I didn't really find anything significant, and I found some
> action point from some meeting notes somewhere that said "deprecate media_ops"
> (not assigned to me) so...

Oh yes, for some reason this ball ended up in our side of the field. But
actually I think the media_ops are not much of an issue, as you don't
set them when you create the shared media device. Problem solved, right?

> If there aren't any then it's a non-issue, but if there are then I was
> wondering if we need to return the shared media device to the driver (as
> opposed to a non-shared regular media device) and use shared versions of media
> device functions that have locking.

+1
I would recommend that just to be on the safe side. And I think I would
make the shared media device an opaque pointer to make sure that there
won't be any monkey business.

Thanks and best regards,
Michael

> 
>>
>>> +struct media_device_shared {
>>> +       struct media_device mdev;
>>> +       struct list_head members;
>>> +       struct list_head links;
>>> +
>>> +       struct list_head list;
>>> +       struct kref refcount;
>>> +
>>> +       struct device *removed_device;
>>> +};
>>> +[...]

