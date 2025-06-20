Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150B0C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ISCyWYleRdPe7ff0Pr8npMhojLb3lL47X6itspEclE=; b=L5id01aHIJl/MoN2AhNpyr8wnJ
	Qvz3KOPOOieU2JWuRuphRw5CzZbRROT1K2dnHb90Sdf1YOAy8k4dwk19Df3ydaq7ObHzVkMmH+1FY
	YvRkoYGOwFU5iSwQ978RP0vo2DKoomuIv24H5Haevpv7yp02VuuHGy/fLU21Xb9jjbuG1Jc6mDpNJ
	A03Kh5ysdHZ/sk3lS7baQnjaOAm6e+y9tKjy1/mM8uqilyazb/i1l3N8FGGRiDWc67VZkhROvo2kB
	jbpaqfRWm1YwiIhxVT7EdPhImQFesNnWgYc91kLZH/7AQyHcsKo5tjOT/T0kmUe6SoAF0cgJ14k+N
	ebuEOWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSf4S-0000000GBbN-42Nn;
	Fri, 20 Jun 2025 16:58:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeOP-0000000G74P-3mUf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 16:15:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DFFC60007;
	Fri, 20 Jun 2025 16:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9D4C4CEE3;
	Fri, 20 Jun 2025 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750436104;
	bh=CJPn9bbmNcJ/RzelH8cowP+F52Wew3w01e0e4IXwTFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j20KO7j+j0nGfe1BWQ6zQlqbGUNcjR+S5/MTCQJs/ZBj2rc8+fnaSxmn8wUOk4BU0
	 mmJkEoBdLAaCRZ5WWs9guEW9AEWs9qdqpRtsp49vgObbvEpbdrMb0eJTz8YMXtt92M
	 2LJ2WJwAnUe9/CBbe50n2DIUBIAp8r3rQD1EJ46o=
Date: Fri, 20 Jun 2025 18:15:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH net 1/4] auxiliary: Allow empty id
Message-ID: <2025062045-velocity-finite-f31c@gregkh>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <20250619200537.260017-2-sean.anderson@linux.dev>
 <2025062004-essay-pecan-d5be@gregkh>
 <8b9662ab-580c-44ea-96ee-b3fe3d4672ff@linux.dev>
 <2025062006-detergent-spruce-5ae2@gregkh>
 <91a9e80a-1a45-470b-90cf-12faae67debd@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91a9e80a-1a45-470b-90cf-12faae67debd@linux.dev>
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

On Fri, Jun 20, 2025 at 12:09:29PM -0400, Sean Anderson wrote:
> On 6/20/25 12:02, Greg Kroah-Hartman wrote:
> > On Fri, Jun 20, 2025 at 11:37:40AM -0400, Sean Anderson wrote:
> >> On 6/20/25 01:13, Greg Kroah-Hartman wrote:
> >> > On Thu, Jun 19, 2025 at 04:05:34PM -0400, Sean Anderson wrote:
> >> >> Support creating auxiliary devices with the id included as part of the
> >> >> name. This allows for non-decimal ids, which may be more appropriate for
> >> >> auxiliary devices created as children of memory-mapped devices. For
> >> >> example, a name like "xilinx_emac.mac.802c0000" could be achieved by
> >> >> setting .name to "mac.802c0000" and .id to AUXILIARY_DEVID_NONE.
> >> > 
> >> > I don't see the justification for this, sorry.  An id is just an id, it
> >> > doesn't matter what is is and nothing should be relying on it to be the
> >> > same across reboots or anywhere else.  The only requirement is that it
> >> > be unique at this point in time in the system.
> >> 
> >> It identifies the device in log messages. Without this you have to read
> >> sysfs to determine what device is (for example) producing an error.
> > 
> > That's fine, read sysfs :)
> 
> I should not have to read sysfs to decode boot output. If there is an
> error during boot I should be able to determine the offending device.
> This very important when the boot process fails before init is started,
> and very convenient otherwise. 

The boot log will show you the name of the device that is having a
problem.  And you get to pick a portion of that name to make it make
some kind of sense to users if you want.

> >> This
> >> may be inconvenient to do if the error prevents the system from booting.
> >> This series converts a platform device with a legible ID like
> >> "802c0000.ethernet" to an auxiliary device, and I believe descriptive
> >> device names produce a better developer experience.
> > 
> > You can still have 802c0000.ethernet be the prefix of the name, that's
> > fine.
> 
> This is not possible due to how the auxiliary bus works. If device's
> name is in the form "foo.id", then the driver must have an
> auxiliary_device_id in its id_table with .name = "foo". So the address
> *must* come after the last period in the name.

So what is the new name without this aux patch that looks so wrong?
What is the current log line before and after the change you made?

thanks,

greg k-h

